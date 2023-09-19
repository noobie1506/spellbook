{% macro 
    oneinch_calls_transfers_macro(
        blockchain,
        project_start_date_str
    ) 
%}

{% set project_start_date = "timestamp '" + project_start_date_str + "'" %} 
{% set lookback_days = -7 %}
{% set transfer_selector = '0xa9059cbb' %}
{% set transfer_from_selector = '0x23b872dd' %}
{% set selector = 'substr(input, 1, 4)' %}

with

methods as (
    select blockchain, contract_address as call_to, selector as call_selector, protocol
    from {{ ref('oneinch_methods') }}
    where blockchain = '{{ blockchain }}' and project = '1inch' and main
)

, calls as (
    select 
        blockchain
        , tx_hash
        , calls.start
        , calls.call_from
        , call_to
        , transactions.tx_from
        , transactions.tx_success
        , calls.call_success
        , call_selector
        , protocol
        , calls.call_input
        , calls.call_output
        , transactions.block_time
    from (
        select 
            '{{ blockchain }}' as blockchain
            , "from" as tx_from
            , "hash" as tx_hash
            , success as tx_success
            , block_time
        from {{ source(blockchain, 'transactions') }}
        where
            {% if is_incremental() %}
                block_time >= cast(date_add('day', {{ lookback_days }}, now()) as timestamp)
            {% else %}
                block_time >= {{ project_start_date }}
            {% endif %}
    ) as transactions 
    join (
        select 
            '{{ blockchain }}' as blockchain
            , tx_hash
            , trace_address as start
            , "from" as call_from
            , success as call_success
            , {{ selector }} as call_selector
            , input as call_input
            , output as call_output
            , "to" as call_to
        from {{ source(blockchain, 'traces') }}
        where 
            {% if is_incremental() %}
                block_time >= cast(date_add('day', {{ lookback_days }}, now()) as timestamp)
            {% else %}
                block_time >= {{ project_start_date }}
            {% endif %}
            and ("to", {{ selector }}) in (select call_to, call_selector from methods)
            and call_type = 'call'
    ) as calls using(blockchain, tx_hash)
    join methods using(blockchain, call_to, call_selector)
)

, merged as (
    select 
        calls.blockchain
        , calls.block_time
        -- tx
        , calls.tx_hash
        , calls.tx_from
        , calls.tx_success
        -- call
        , calls.call_success
        , calls.start as call_trace_address
        , calls.call_from
        , calls.call_from as caller -- TEMP COLUMN, WILL BE REMOVED AS SOON AS WE MIGRATE DUNE QUERIES
        , calls.call_to
        , calls.call_selector
        , calls.protocol
        -- transfer
        , transfers.trace_address as transfer_trace_address
        , transfers.contract_address
        , transfers.amount
        , transfers.native_token
        , transfers.transfer_from
        , transfers.transfer_to
        , transfers.transfer_top_level
        , transfers.transfers_between_players
        , rn_tta_asc
        , rn_tta_desc
        -- ext
        , calls.call_output 
        , calls.call_input
        , date_trunc('minute', calls.block_time) as minute
        , date(date_trunc('month', calls.block_time)) as block_month
    from calls
    left join (

        select 
            blockchain
            , tx_hash
            , trace_address
            , if(native_token, evms.wrapped_native_token_address, contract_address) as contract_address
            , native_token
            , amount
            , transfer_from
            , transfer_to
            -- transfers in token transfer
            -- , not contains(transform(array_remove(trf, trace_address), x -> if(slice(trace_address, 1, cardinality(x)) = x, 'sub', 'root')), 'sub') as transfer_top_level
            -- , count(*) over(partition by blockchain, tx_hash, array_sort(array[transfer_from, transfer_to])) as transfers_between_players
            , 1 as transfer_top_level
            , 1 as transfers_between_players  
            , row_number() over(partition by tx_hash order by trace_address asc) as rn_tta_asc
            , row_number() over(partition by tx_hash order by trace_address desc) as rn_tta_desc
        from (
            select 
                '{{ blockchain }}' as blockchain
                , tx_hash
                , trace_address
                , if(value > uint256 '0', 0xae, "to") as contract_address
                , if(value > uint256 '0', true, false) as native_token
                , case {{ selector }}
                    when {{ transfer_selector }} then bytearray_to_uint256(substr(input, 37, 32))
                    when {{ transfer_from_selector }} then bytearray_to_uint256(substr(input, 69, 32))
                    else value
                end as amount
                , case
                    when {{ selector }} = {{ transfer_selector }} or value > uint256 '0' then "from"
                    when {{ selector }} = {{ transfer_from_selector }} then substr(input, 17, 20)
                end as transfer_from
                , case
                    when {{ selector }} = {{ transfer_selector }} then substr(input, 17, 20)
                    when {{ selector }} = {{ transfer_from_selector }} then substr(input, 49, 20)
                    when value > uint256 '0' then "to"
                end as transfer_to
                -- , array_agg(if(value > uint256 '0', null, trace_address)) over(partition by tx_hash) as trf
                , 1 as trf
            from {{ source(blockchain, 'traces') }}
            where
                {% if is_incremental() %}
                    block_time >= date_add('day', {{ lookback_days }}, now())
                {% else %}
                    block_time >= {{ project_start_date }}
                {% endif %}
                and ({{ selector }} in ({{ transfer_selector }}, {{ transfer_from_selector }}) or value > uint256 '0')
                and call_type = 'call'
                and tx_success
                and success
        )
        join {{ ref('evms_info') }} evms using(blockchain)
        
    ) transfers on transfers.tx_hash = calls.tx_hash
        and slice(transfers.trace_address, 1, cardinality(calls.start)) = calls.start 
)

select 
    *
    , cast(tx_hash as varchar)||'--'||
        array_join(call_trace_address, '_')||'--'||
        array_join(coalesce(transfer_trace_address, array[-1]), '_')
    as unique_call_transfer_id
from merged

{% endmacro %}
