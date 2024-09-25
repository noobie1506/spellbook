{{ config(

        schema = 'dex_mass_decoding_ethereum',
        alias = 'uniswap_v3_base_trades',
        partition_by = ['block_month'],
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'evt_index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
        )
}}

WITH all_decoded_trades AS (
    {{
        uniswap_v3_forks_trades(
            blockchain = 'ethereum'
            , version = 'null'
            , project = 'null'
            , Pair_evt_Swap = ref('uniswap_v3_pool_decoding_ethereum')
            , Factory_evt_PoolCreated = ref('uniswap_v3_factory_decoding_ethereum')
        )
    }}
)

SELECT uniswap_v3_base_trades.*
FROM all_decoded_trades AS uniswap_v3_base_trades
INNER JOIN (
    SELECT
        count(*) as transfer_count,
        contract_address,
        tx_hash
    FROM ethereum.transfers
    GROUP BY contract_address, tx_hash
    HAVING count(*) > 1
) AS transfers
ON (transfers.tx_hash = uniswap_v3_base_trades.tx_hash)
   AND (transfers.contract_address = uniswap_v3_base_trades.token_bought_address
        OR transfers.contract_address = uniswap_v3_base_trades.token_sold_address)

