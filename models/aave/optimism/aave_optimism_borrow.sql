{{
  config(
    schema = 'aave_optimism',
    alias = 'borrow',
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
  loan_type,
  symbol,
  token_address,
  borrower,
  on_behalf_of,
  repayer,
  liquidator,
  amount,
  usd_amount,
  block_month,
  block_time,
  block_number,
  project_contract_address,
  tx_hash,
  evt_index
from {{ ref('lending_borrow') }}
where blockchain = 'optimism'
  and project = 'aave'
