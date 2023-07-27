{{ config(
	tags=['legacy'],
	
        alias = alias('deposits', legacy_model=True),
        materialized='incremental',
        partition_by=['block_date'],
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['blockchain', 'block_date', 'tx_hash', 'evt_index'],
        post_hook='{{ expose_spells(\'["ethereum", "bnb", "avalanche_c", "gnosis", "optimism", "arbitrum", "polygon"]\',
                                    "project",
                                    "tornado_cash",
                                    \'["hildobby", "dot2dotseurat"]\') }}'
        )
}}


{% set tornado_cash_deposits_models = [
ref('tornado_cash_arbitrum_deposits')
,ref('tornado_cash_avalanche_c_deposits')
,ref('tornado_cash_bnb_deposits')
,ref('tornado_cash_ethereum_deposits')
,ref('tornado_cash_gnosis_deposits')
,ref('tornado_cash_optimism_deposits')
,ref('tornado_cash_polygon_deposits')
] %}

SELECT *
FROM (
    {% for tornado_cash_deposits_model in tornado_cash_deposits_models %}
    SELECT block_time
        , currency_contract
        , currency_symbol
        , blockchain
        , tornado_version
        , depositor
        , contract_address
        , amount
        , tx_hash
        , leaf_index
        , evt_index
        , block_date
    FROM {{ tornado_cash_deposits_model }}
    {% if not loop.last %}
    UNION ALL
    {% endif %}
    {% endfor %}

)