{{
  config(
    schema = 'aave_optimism',
    alias = 'supply',
    materialized = 'view',
    post_hook = '{{ expose_spells(\'["optimism"]\',
                                    "project",
                                    "aave",
                                    \'["tomfutago"]\') }}'
  )
}}

select
  blockchain,
  project,
  version,
  transaction_type,
  symbol,
  token_address,
  depositor,
  on_behalf_of,
  withdrawn_to,
  liquidator,
  amount,
  amount_usd,
  block_month,
  block_time,
  block_number,
  project_contract_address,
  tx_hash,
  evt_index
from {{ source('lending','supply') }}
where blockchain = 'optimism'
  and project = 'aave'
