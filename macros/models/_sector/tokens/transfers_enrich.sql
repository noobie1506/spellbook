{%- macro case_when_token_standard(native_column, erc20_column, else_column) -%}
CASE token_standard
    WHEN 'native' THEN {{native_column}}
    WHEN 'erc20' THEN {{erc20_column}}
    WHEN 'bep20' THEN {{erc20_column}}
    ELSE {{else_column}}
END
{%- endmacro-%}

{%- macro transfers_enrich(blockchain, transfers_base, native_symbol) %}
SELECT t.blockchain
, t.block_time
, t.block_number
, t.tx_hash
, t.tx_index
, t.evt_index
, t.trace_address
, t.token_standard
, t.tx_from
, t.tx_to
, t."from"
, t.to
, t.contract_address
, {{ case_when_token_standard("'" ~ native_symbol ~ "'", 'tokens_erc20.symbol', 'NULL') }} AS symbol
, t.amount_raw
, {{case_when_token_standard('t.amount_raw / power(10, 18)', 'amount_raw / power(10, tokens_erc20.decimals)', 'cast(t.amount_raw as double)')}} AS amount
, prices.price AS usd_price
, {{case_when_token_standard('(t.amount_raw / power(10, 18)) * prices.price',
    '(t.amount_raw / power(10, tokens_erc20.decimals)) * prices.price',
    'NULL')}} AS usd_amount
FROM {{ source('prices', 'usd') }} prices
-- Right join due to performance reasons
RIGHT JOIN {{transfers_base}} t ON (
    CASE
        WHEN type = 'erc20' THEN prices.contract_address = balances.contract_address and prices.blockchain = '{{ blockchain }}'
        WHEN type = 'native' THEN contract_address = (SELECT wrapped_native_token_address FROM {{ ref('evms_info') }} WHERE blockchain='{{blockchain}}')
        ELSE false
    END)
    AND prices.minute = date_trunc('minute', t.block_time)
LEFT JOIN {{ref('tokens_erc20')}} tokens_erc20 on tokens_erc20.blockchain = '{{blockchain}}' AND tokens_erc20.contract_address = t.contract_address
{%- endmacro %}