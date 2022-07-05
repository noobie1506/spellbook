{% macro alter_table_properties() %}
{%- if target.name == 'prod'-%}

{% set balances_ethereum_erc20_day %}
ALTER VIEW balances_ethereum.erc20_day SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["soispoke","dot2dotseurat"]');
{% endset %}

{% set balances_ethereum_erc20_hour %}
ALTER VIEW balances_ethereum.erc20_hour SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["soispoke","dot2dotseurat"]');
{% endset %}

{% set balances_ethereum_erc20_latest %}
ALTER VIEW balances_ethereum.erc20_latest SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["soispoke","dot2dotseurat"]');
{% endset %}

{% set balances_ethereum_erc721_day %}
ALTER VIEW balances_ethereum.erc721_day SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["hildobby","soispoke","dot2dotseurat"]');
{% endset %}

{% set balances_ethereum_erc721_hour %}
ALTER VIEW balances_ethereum.erc721_hour SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["hildobby","soispoke","dot2dotseurat"]');
{% endset %}

{% set balances_ethereum_erc721_latest %}
ALTER VIEW balances_ethereum.erc721_latest SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["hildobby","soispoke","dot2dotseurat"]');
{% endset %}

{% set balances_ethereum_erc1155_day %}
ALTER VIEW balances_ethereum.erc1155_day SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set balances_ethereum_erc1155_hour %}
ALTER VIEW balances_ethereum.erc1155_hour SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set balances_ethereum_erc1155_latest %}
ALTER VIEW balances_ethereum.erc1155_latest SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='balances',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set opensea_transactions %}
ALTER TABLE opensea.transactions SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='opensea',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set opensea_trades %}
ALTER VIEW opensea.trades SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='opensea',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set opensea_mints %}
ALTER VIEW opensea.mints SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='opensea',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set opensea_burns %}
ALTER VIEW opensea.burns SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='opensea',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set opensea_fees %}
ALTER VIEW opensea.fees SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='opensea',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set looksrare_ethereum_transactions %}
ALTER TABLE looksrare_ethereum.transactions SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='looksrare',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set looksrare_ethereum_trades %}
ALTER VIEW looksrare_ethereum.trades SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='looksrare',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set looksrare_ethereum_mints %}
ALTER VIEW looksrare_ethereum.mints SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='looksrare',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set looksrare_ethereum_burns %}
ALTER VIEW looksrare_ethereum.burns SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='looksrare',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set looksrare_ethereum_fees %}
ALTER VIEW looksrare_ethereum.fees SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='looksrare',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}


{% set magiceden_transactions %}
ALTER TABLE magiceden.transactions SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='magiceden',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set magiceden_trades %}
ALTER VIEW magiceden.trades SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='magiceden',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set magiceden_mints %}
ALTER VIEW magiceden.mints SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='magiceden',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set nft_transactions %}
ALTER TABLE nft.transactions SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='nft',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set nft_trades %}
ALTER TABLE nft.trades SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='nft',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set nft_mints %}
ALTER TABLE nft.mints SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='nft',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set nft_burns %}
ALTER TABLE nft.burns SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='nft',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set nft_fees %}
ALTER TABLE nft.fees SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum","solana"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='nft',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set tokens_ethereum_erc20 %}
ALTER VIEW tokens_ethereum.erc20 SET TBLPROPERTIES ('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='tokens',
                                                    'dune.data_explorer.contributors'='["soispoke","dot2dotseurat"]');
{% endset %}

{% set transfers_ethereum_erc20 %}
ALTER VIEW transfers_ethereum.erc20 SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='transfers',
                                                    'dune.data_explorer.contributors'='["soispoke","dot2dotseurat"]');
{% endset %}

{% set tokens_ethereum_nft %}
ALTER VIEW tokens_ethereum.nft SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='sector',
                                                    'dune.data_explorer.abstraction.name'='tokens',
                                                    'dune.data_explorer.contributors'='["dot2dotseurat","soispoke"]');
{% endset %}

{% set uniswap_trades %}
ALTER TABLE uniswap.trades SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='uniswap',
                                                    'dune.data_explorer.contributors'='["soispoke"]');
{% endset %}

{% set seaport_ethereum_view_transactions %}
ALTER VIEW seaport_ethereum.view_transactions SET TBLPROPERTIES('dune.public'='true',
                                                    'dune.data_explorer.blockchains'='["ethereum"]',
                                                    'dune.data_explorer.category'='abstraction',
                                                    'dune.data_explorer.abstraction.type'='project',
                                                    'dune.data_explorer.abstraction.name'='seaport',
                                                    'dune.data_explorer.contributors'='["sohawk","soispoke"]');
{% endset %}

{% do run_query(balances_ethereum_erc20_day) %}
{% do run_query(balances_ethereum_erc20_hour) %}
{% do run_query(balances_ethereum_erc20_latest) %}
{% do run_query(balances_ethereum_erc721_day) %}
{% do run_query(balances_ethereum_erc721_hour) %}
{% do run_query(balances_ethereum_erc721_latest) %}
{% do run_query(balances_ethereum_erc1155_day) %}
{% do run_query(balances_ethereum_erc1155_hour) %}
{% do run_query(balances_ethereum_erc1155_latest) %}
{% do run_query(opensea_transactions) %}
{% do run_query(opensea_trades) %}
{% do run_query(opensea_mints) %}
{% do run_query(opensea_burns) %}
{% do run_query(opensea_fees) %}
{% do run_query(looksrare_ethereum_transactions) %}
{% do run_query(looksrare_ethereum_trades) %}
{% do run_query(looksrare_ethereum_mints) %}
{% do run_query(looksrare_ethereum_burns) %}
{% do run_query(looksrare_ethereum_fees) %}
{% do run_query(magiceden_transactions) %}
{% do run_query(magiceden_trades) %}
{% do run_query(magiceden_mints) %}
{% do run_query(nft_transactions) %}
{% do run_query(nft_trades) %}
{% do run_query(nft_mints) %}
{% do run_query(nft_burns) %}
{% do run_query(nft_fees) %}
{% do run_query(tokens_ethereum_erc20) %}
{% do run_query(transfers_ethereum_erc20) %}
{% do run_query(tokens_ethereum_nft) %}
{% do run_query(seaport_ethereum_view_transactions) %}
{% do run_query(uniswap_trades) %}

{% do log("Tables generated", info=True) %}
{%- else -%}
{%- endif -%}
{% endmacro %}