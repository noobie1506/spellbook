{% macro transfers_base_with_wrapped(blockchain, traces, transactions, erc20_transfers, native_contract_address = null, wrapped_token_deposit = null, wrapped_token_withdrawal = null) %}
{%- set token_standard_20 = 'bep20' if blockchain == 'bnb' else 'erc20' -%}
{%- set default_address = '0x0000000000000000000000000000000000000000' -%}

WITH transfers AS (
    SELECT
        block_time
        , block_number
        , tx_hash
        , cast(NULL as bigint) AS evt_index
        , trace_address
        {% if native_contract_address%}
        , {{native_contract_address}} AS contract_address
        {% else %}
        , CAST(NULL AS varbinary) AS contract_address
        {% endif %}
        , 'native' AS token_standard
        , "from"
        , to
        , value AS amount_raw
    FROM {{ traces }}
    WHERE success
        AND (call_type NOT IN ('delegatecall', 'callcode', 'staticcall') OR call_type IS null)
        AND value > UINT256 '0'
        {% if is_incremental() %}
        AND {{incremental_predicate('block_time')}}
        {% endif %}

    UNION ALL

    SELECT
        t.evt_block_time AS block_time
        , t.evt_block_number AS block_number
        , t.evt_tx_hash AS tx_hash
        , t.evt_index
        , CAST(NULL AS ARRAY<BIGINT>) AS trace_address
        , t.contract_address
        , CASE
            WHEN t.contract_address =
                {% if native_contract_address %}
                    {{native_contract_address}}
                {% else %}
                    CAST(NULL AS varbinary)
                {% endif %}
            THEN 'native'
            ELSE '{{token_standard_20}}'
            END AS token_standard
        , t."from"
        , t.to
        , t.value AS amount_raw
    FROM {{ erc20_transfers }} t
    {% if is_incremental() %}
    WHERE {{incremental_predicate('evt_block_time')}}
    {% endif %}

    {% if wrapped_token_deposit %}
    UNION ALL
    SELECT
        t.evt_block_time AS block_time
        , t.evt_block_number AS block_number
        , t.evt_tx_hash AS tx_hash
        , t.evt_index
        , CAST(NULL AS ARRAY<BIGINT>) AS trace_address
        , t.contract_address
        , '{{token_standard_20}}' AS token_standard -- technically this is not a standard 20 token, but we use it for consistency
        , {{default_address}} AS "from"
        , t.dst as "to"
        , t.wad AS amount_raw -- is this safe cross chain?
    FROM {{ wrapped_token_deposit }} t
    {% if is_incremental() %}
    WHERE {{incremental_predicate('t.evt_block_time')}}
    {% endif %}

    {% endif %}
     {% if wrapped_token_withdrawal %}
    UNION ALL

    SELECT
        t.evt_block_time AS block_time
        , t.evt_block_number AS block_number
        , t.evt_tx_hash AS tx_hash
        , t.evt_index
        , CAST(NULL AS ARRAY<BIGINT>) AS trace_address
        , t.contract_address
        , '{{token_standard_20}}' AS token_standard -- technically this is not a standard 20 token, but we use it for consistency
        , t.src as "from"
        , {{default_address}} AS "to"
        , t.wad AS amount_raw -- is this safe cross chain?
    FROM {{ wrapped_token_withdrawal }} t
    {% if is_incremental() %}
    WHERE {{incremental_predicate('evt_block_time')}}
    {% endif %}
    {% endif %}
)
SELECT
    -- We have to create this unique key because evt_index and trace_address can be null
    {{dbt_utils.generate_surrogate_key(['t.block_number', 'tx.index', 't.evt_index', "array_join(t.trace_address, ',')"])}} as unique_key
    , '{{blockchain}}' as blockchain
    , cast(date_trunc('day', t.block_time) as date) as block_date
    , t.block_time
    , t.block_number
    , t.tx_hash
    , t.evt_index
    , t.trace_address
    , t.token_standard
    , tx."from" AS tx_from
    , tx."to" AS tx_to
    , tx."index" AS tx_index
    , t."from"
    , t.to
    , t.contract_address
    , t.amount_raw
FROM transfers t
INNER JOIN {{ transactions }} tx ON
    tx.block_date = date_trunc('day', t.block_time)
    AND tx.hash = t.tx_hash
    {% if is_incremental() %}
    AND {{incremental_predicate('tx.block_time')}}
    {% endif %}
{% endmacro %}