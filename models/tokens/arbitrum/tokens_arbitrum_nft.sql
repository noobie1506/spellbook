{{ config(
	tags=['legacy'],
        alias = alias('nft', legacy_model=True)
        , materialized = 'table'
        , post_hook='{{ expose_spells(\'["arbitrum"]\',
                                "sector",
                                "tokens",
                                \'["0xRob"]\') }}'
        )
}}

SELECT
    c.contract_address
  , t.name
  , t.symbol
  , c.standard
  FROM {{ ref('tokens_arbitrum_nft_standards')}} c
LEFT JOIN  {{ref('tokens_arbitrum_nft_curated')}} t
ON c.contract_address = t.contract_address
