 {{
  config(
        alias='mints')
}}

SELECT blockchain,
project,
version,
block_time,
token_id,
collection,
amount_usd,
token_standard,a
trade_type,
number_of_items,
trade_category,
evt_type,
seller,
buyer,
amount_original,
amount_raw,
currency_symbol,
currency_contract,
currency_contract_original,
nft_contract_address,
project_contract_address,
aggregator_name,
aggregator_address,
tx_hash,
tx_from,
tx_to,
unique_trade_id
FROM ({{ ref('looksrare_ethereum_transactions') }})
WHERE evt_type = 'Mint'