{{ 
    config(
        schema = 'safe_arbitrum',
        alias = 'eth_transfers',
        partition_by = ['block_month'],
        on_schema_change='fail',
        materialized='incremental',
        file_format ='delta',
        incremental_strategy='merge',
        unique_key = ['block_date', 'address', 'tx_hash', 'trace_address'],
        post_hook='{{ expose_spells(blockchains = \'["arbitrum"]\',
                                    spell_type = "project",
                                    spell_name = "safe",
                                    contributors = \'["tschubotz", "hosuke"]\') }}'
    ) 
}}

{{
    safe_native_transfers(
        blockchain = 'arbitrum'
        , native_token_symbol = 'ETH'
        , project_start_date = '2021-06-20'
    )
}}
