{{ config(
        tags = [ 'static'],
        schema='staking_ethereum',
        alias = 'info',
        post_hook='{{ expose_spells(\'["ethereum"]\',
                                    "sector",
                                    "staking",
                                    \'["hildobby"]\') }}')
}}

SELECT entity, x_username
FROM (VALUES
    	('Lido', 'LidoFinance')
    , ('Coinbase', 'coinbase')
    , ('Figment', 'Figment_io')
    , ('Binance', 'binance')
    , ('Kraken', 'krakenfx')
    , ('Rocket Pool', 'Rocket_Pool')
    , ('Staked.us', 'staked_us')
    , ('OKX', 'okx')
    , ('Bitcoin Suisse', 'BitcoinSuisseAG')
    , ('DARMA Capital', 'DARMACapital')
    , ('stakefish', 'stakefish')
    , ('Upbit', 'upbitglobal')
    , ('Frax Finance', 'fraxfinance')
    , ('Celsius', 'CelsiusNetwork')
    , ('P2P.org', 'P2Pvalidator')
    , ('Octant', 'OctantApp')
    , ('Stakewise', 'stakewise_io')
    , ('Daniel Wang', 'daniel_taikoxyz')
    , ('MyEtherWallet', 'myetherwallet')
    , ('StakeHound', 'stakedTokens')
    , ('Swell', 'swellnetworkio')
    , ('Bitstamp', 'Bitstamp')
    , ('HTX', 'HTX_Global')
    , ('imToken', 'imTokenOfficial')
    , ('Mantle', '0xMantle')
    , ('XHash', 'XHash_com')
    , ('Stkr (Ankr)', 'ankr')
    , ('Paxos', 'Paxos')
    , ('CoinDCX', 'CoinDCX')
    , ('Ebunker', 'ebunker_eth')
    , ('BTC-e', 'btcecom')
    , ('Bitget', 'bitgetglobal')
    , ('Flipside', 'flipsidecrypto')
    , ('Uphold', 'UpholdInc')
    , ('Redacted Pirex', 'redactedcartel')
    , ('KuCoin', 'kucoincom')
    , ('Bake', 'bake_io')
    , ('Consensys', 'Consensys')
    , ('Liquid Collective', 'liquid_col')
    , ('Stader', 'staderlabs')
    , ('MEV Protocol', 'mevdotio')
    , ('Mercado Bitcoin', 'MercadoBitcoin')
    , ('Bitfinex', 'bitfinex')
    , ('Chorus One', 'ChorusOne')
    , ('WEX Exchange', 'WEXnz')
    , ('ether.fi', 'ether_fi')
    , ('CoinSpot', 'coinspotau')
    , ('EPotter', 'EPotterOfficial')
    , ('Harbour', 'harbour_fi')
    , ('Bitpanda', 'Bitpanda_global')
    , ('Ether Capital', 'ethcap')
    , ('Binance US', 'BinanceUS')
    , ('Hord', 'HordApp')
    , ('ClayStack', 'ClayStack_HQ')
    , ('Poloniex', 'Poloniex')
    , ('Bitpie', 'BitpieWallet')
    , ('Tranchess', 'Tranchess')
    , ('StakeWise', 'stakewise_io')
    , ('Node DAO', 'Node_DAO')
    , ('Taylor Gerring', 'TaylorGerring')
    , ('StaFi', 'StaFi_Protocol')
    , ('Vitalik Buterin', 'VitalikButerin')
    , ('cryptostake.com', 'Cryptostakecom')
    , ('Everstake', 'everstake_pool')
    , ('SharedStake', 'SharedStakeNews')
    , ('HashKing', 'HashKingGlobal')
    , ('Kiln', 'Kiln_finance')
    , ('Revolut', 'RevolutApp')
    , ('Teku Team', 'Teku_Consensys')
    , ('Prysm Team', 'prylabs')
    , ('Sigma Prime Team', 'sigp_io')
    , ('Nimbus Team', 'ethnimbus')
    , ('RockX', 'rockx_official')
    , ('Bifrost', 'Bifrost')
    , ('MintDice.com', 'MintDice')
    , ('DxPool', 'dxpoolOfficial')
    --, ('Blox Staking', '')
    --, ('staked.finance', '')
    , ('BlockFi', 'BlockFi')
    , ('neukind.com', 'neukindinc')
    , ('Tetranode', 'Tetranode')
    , ('stereum.net', 'stereumdev')
    , ('SenseiNode', 'SenseiNode')
    , ('Blockdaemon', 'BlockdaemonHQ')
    , ('WeekInEth', 'WeekInEthNews')
    , ('Ethereum on ARM', 'EthereumOnARM')
    , ('Gate.io', 'gate_io')
    , ('TideBit', 'tidebitofficial')
    , ('CREAM', 'CreamdotFinance')
    , ('Eth2Stake', 'Eth2Stake')
    --, ('Linke Yang', '')
    , ('Auxo', 'AuxoDAO')
    , ('Gemini', 'Gemini')
    , ('Unagii', 'unagiidotcom')
    , ('Consensus Cell Network', 'eCell_network')
    , ('benyu.eth', 'Intenex')
    , ('benjaminchodroff.eth', 'benchodroff')
    , ('jzchew.et', 'jzjmt3')
    , ('ctrl-alt.eth', 'grntwrght')
    , ('mas.eth', 'PrudentAnon')
    , ('johnc.eth', 'calabreum')
    , ('Senator Briggs', 'Briggs')
    , ('0xicepat.eth', 'IcepatID')
    , ('Mahachai', 'EthereumThaila1')
    , ('Alex Chapman', 'Achap5dk')
    , ('mostdope.eth', '0xMostdope')
    , ('Colin Robinson', 'kinematec')
    , ('hexxed.eth', 'pig_space')
    , ('Anpan', 'anpan02')
    , ('rcpw.eth', 'rcpw_')
    , ('calum.eth', 'calumtomeny')
    , ('papcrypto.eth', 'papcrypto')
    , ('MonoMesa.eth', 'MonoMesa')
    , ('buffalospace.eth', 'buffalospace00')
    , ('kzg.eth', 'kassandraETH')
    , ('Renzo', 'RenzoProtocol')
    , ('Cumberland', 'CumberlandSays')
    , ('Galaxy Digital', 'GalaxyHQ')
    , ('Copper.co', 'CopperHQ')
    , ('Kelp DAO', 'KelpDAO')
    , ('Puffer Finance', 'puffer_finance')
    , ('Eigenpie', 'Eigenpiexyz_io')

    -- Unknown Clusters:
    , ('Cluster 0x0f5b', 'etherscan.io/address/0x0f5b2f0d89f66b163e5e8e2ccf4de706c53a5060')
    , ('Cluster 0xc372', 'etherscan.io/address/0xc372d454835ac654d43b99c7789cc1c32f364237')
    ) AS temp_table (entity, x_username)