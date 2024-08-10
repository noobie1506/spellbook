{% macro add_tx_columns_cross_chain(
    model_cte
    , blockchain
    , columns = []
    )
%}

select
    model.*
    {% for column in columns %}
    , tx."{{column}}" as tx_{{column}}
    {% endfor %}
from {{model_cte}} model
inner join {{source(blockchain, 'transactions')}} tx
    on
    --model.block_date = tx.block_date
    model.block_number = tx.block_number
    and model.tx_hash = tx.hash
    and model.blockchain = tx.blockchain
    {% if is_incremental() %}
    and {{incremental_predicate('tx.block_time')}}
    {% endif %}
{% endmacro %}