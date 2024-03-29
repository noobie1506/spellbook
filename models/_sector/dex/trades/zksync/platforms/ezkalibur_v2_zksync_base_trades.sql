{{
    config(
        schema = 'ezkalibur_v2_zksync',
        alias = 'base_trades',
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'evt_index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
    )
}}

{{
    uniswap_compatible_v2_trades(
        blockchain = 'zksync',
        project = 'ezkalibur',
        version = '2',
        Pair_evt_Swap = source('ezkalibur_v2_zksync', 'EZKaliburPair_evt_Swap'),
        Factory_evt_PairCreated = source('ezkalibur_v2_zksync', 'EZKaliburFactory_evt_PairCreated')
    )
}}
