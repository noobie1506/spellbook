-- this macro helps to optimize the etl in case of adding new contract to a certain chain so it triggers pipeline only for this chain
{% macro oneinch_mapped_contracts_macro(blockchain) %}



{% set 
    config = [
          ('0xc586bef4a0992c495cf22e1aeee4e446cecdee0e', 'true', '1inch'                , 'OneSplit'                , ['ethereum'])
        , ('0xe4c577bdec9ce0f6c54f2f82aed5b1913b71ae2f', 'true', '1inch'                , 'ExchangeV1'              , ['ethereum'])
        , ('0x0000000006adbd7c01bc0738cdbfc3932600ad63', 'true', '1inch'                , 'ExchangeV2'              , ['ethereum'])
        , ('0x0000000053d411becdb4a82d8603edc6d8b8b3bc', 'true', '1inch'                , 'ExchangeV3'              , ['ethereum'])
        , ('0x000005edbbc1f258302add96b5e20d3442e5dd89', 'true', '1inch'                , 'ExchangeV4'              , ['ethereum'])
        , ('0x0000000f8ef4be2b7aed6724e893c1b674b9682d', 'true', '1inch'                , 'ExchangeV5'              , ['ethereum'])
        , ('0x111112549cfedf7822eb11fbd8fd485d8a10f93f', 'true', '1inch'                , 'ExchangeV6'              , ['ethereum'])
        , ('0x111111254b08ceeee8ad6ca827de9952d2a46781', 'true', '1inch'                , 'ExchangeV7'              , ['ethereum'])
        , ('0x3ef51736315f52d568d6d2cf289419b9cfffe782', 'true', '1inch'                , 'LimitOrderProtocolV1'    , ['ethereum'])
        , ('0xe3456f4ee65e745a44ec3bcb83d0f2529d1b84eb', 'true', '1inch'                , 'LimitOrderProtocolV1'    , ['bnb'])
        , ('0xb707d89d29c189421163515c59e42147371d6857', 'true', '1inch'                , 'LimitOrderProtocolV1'    , ['polygon','optimism'])
        , ('0xe295ad71242373c37c5fda7b57f26f9ea1088afe', 'true', '1inch'                , 'LimitOrderProtocolV1'    , ['arbitrum'])
        , ('0x119c71d3bbac22029622cbaec24854d3d32d2828', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['ethereum'])
        , ('0x1e38eff998df9d3669e32f4ff400031385bf6362', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['bnb'])
        , ('0x94bc2a1c732bcad7343b25af48385fe76e08734f', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['polygon'])
        , ('0x54431918cec22932fcf97e54769f4e00f646690f', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['gnosis'])
        , ('0x7f069df72b7a39bce9806e3afaf579e54d8cf2b9', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['arbitrum'])
        , ('0x0f85a912448279111694f4ba4f85dc641c54b594', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['avalanche_c'])
        , ('0x11431a89893025d2a48dca4eddc396f8c8117187', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['optimism'])
        , ('0x11dee30e710b8d4a8630392781cc3c0046365d4c', 'true', '1inch'                , 'LimitOrderProtocolV2'    , ['fantom'])
        , ('0x11111254369792b2ca5d084ab5eea397ca8fa48b', 'true', '1inch'                , 'AggregationRouterV1'     , ['ethereum'])
        , ('0x111111125434b319222cdbf8c261674adb56f3ae', 'true', '1inch'                , 'AggregationRouterV2'     , ['ethereum'])
        , ('0x111111254bf8547e7183e4bbfc36199f3cedf4a1', 'true', '1inch'                , 'AggregationRouterV2'     , ['bnb'])
        , ('0x11111112542d85b3ef69ae05771c2dccff4faa26', 'true', '1inch'                , 'AggregationRouterV3'     , ['ethereum','bnb','polygon','arbitrum','optimism'])
        , ('0x1111111254fb6c44bac0bed2854e76f90643097d', 'true', '1inch'                , 'AggregationRouterV4'     , ['ethereum','bnb','polygon','arbitrum','avalanche_c','gnosis','fantom'])
        , ('0x1111111254760f7ab3f16433eea9304126dcd199', 'true', '1inch'                , 'AggregationRouterV4'     , ['optimism'])
        , ('0x1111111254eeb25477b68fb85ed929f73a960582', 'true', '1inch'                , 'AggregationRouterV5'     , ['ethereum','bnb','polygon','arbitrum','avalanche_c','gnosis','optimism','fantom','base'])
        , ('0x6e2b76966cbd9cf4cc2fa0d76d24d5241e0abc2f', 'true', '1inch'                , 'AggregationRouterV5'     , ['zksync'])
        , ('0x111111125421ca6dc452d289314280a0f8842a65', 'true', '1inch'                , 'AggregationRouterV6'     , ['ethereum','bnb','polygon','arbitrum','avalanche_c','gnosis','optimism','fantom','base'])
        , ('0x6fd4383cb451173d5f9304f041c7bcbf27d561ff', 'true', '1inch'                , 'AggregationRouterV6'     , ['zksync'])
        , ('0xa88800cd213da5ae406ce248380802bd53b47647', 'true', '1inch'                , 'SettlementV1'            , ['ethereum'])
        , ('0x1d0ae300eec4093cee4367c00b228d10a5c7ac63', 'true', '1inch'                , 'SettlementV1'            , ['bnb'])
        , ('0x1e8ae092651e7b14e4d0f93611267c5be19b8b9f', 'true', '1inch'                , 'SettlementV1'            , ['polygon'])
        , ('0x4bc3e539aaa5b18a82f6cd88dc9ab0e113c63377', 'true', '1inch'                , 'SettlementV1'            , ['arbitrum'])
        , ('0xd89adc20c400b6c45086a7f6ab2dca19745b89c2', 'true', '1inch'                , 'SettlementV1'            , ['optimism'])
        , ('0x7731f8df999a9441ae10519617c24568dc82f697', 'true', '1inch'                , 'SettlementV1'            , ['avalanche_c'])
        , ('0xcbdb7490968d4dbf183c60fc899c2e9fbd445308', 'true', '1inch'                , 'SettlementV1'            , ['gnosis'])
        , ('0xa218543cc21ee9388fa1e509f950fd127ca82155', 'true', '1inch'                , 'SettlementV1'            , ['fantom'])
        , ('0x7f069df72b7a39bce9806e3afaf579e54d8cf2b9', 'true', '1inch'                , 'SettlementV1'            , ['base'])
        , ('0x11de482747d1b39e599f120d526af512dd1a9326', 'true', '1inch'                , 'SettlementV1'            , ['zksync'])
        , ('0x0cae51e1032e8461f4806e26332c030e34de3adb', 'true', 'AnySwap'              , 'AnyswapV3Router'         , ['arbitrum'])
        , ('0x7782046601e7b9b05ca55a3899780ce6ee6b8b2b', 'true', 'AnySwap'              , 'AnyswapV6Router'         , ['ethereum'])
        , ('0xb0731d50c681c45856bfc3f7539d5f61d4be81d8', 'true', 'AnySwap'              , 'UNDEFINED'               , ['avalanche_c'])
        , ('0xe1d592c3322f1f714ca11f05b6bc0efef1907859', 'true', 'AnySwap'              , 'AnyswapV6Router'         , ['bnb'])
        , ('0xf9736ec3926703e85c843fc972bd89a7f8e827c0', 'true', 'AnySwap'              , 'AnyswapV3Router'         , ['bnb'])
        , ('0xc0788a3ad43d79aa53b09c2eacc313a787d1d607', 'true', 'ApeSwap'              , 'ApeRouter'               , ['polygon'])
        , ('0xcf0febd3f17cef5b47b0cd257acf6025c5bff3b7', 'true', 'ApeSwap'              , 'UNDEFINED'               , ['bnb'])
        , ('0x6947a425453d04305520e612f0cb2952e4d07d62', 'true', 'Arbswap'              , 'ArbswapSmartRouter'      , ['arbitrum'])
        , ('0x8317c460c22a9958c27b4b6403b98d2ef4e2ad32', 'true', 'BabySwap'             , 'UNDEFINED'               , ['bnb'])
        , ('0xba12222222228d8ba445958a75a0704d566bf2c8', 'true', 'Balancer'             , 'Vault'                   , ['ethereum','bnb','polygon','arbitrum','avalanche_c','gnosis','optimism','base'])
        , ('0x6093aebac87d62b1a5a4ceec91204e35020e38be', 'true', 'Baoswap'              , 'UniswapV2Router02'       , ['gnosis'])
        , ('0xbbbbbBB520d69a9775E85b458C58c648259FAD5F', 'true', 'Bebop'                , 'BebopSettlement'         , ['ethereum'])
        , ('0xf4D3269fACF1FfD633195715e5d1357f0d4489d5', 'true', 'Bebop'                , 'BebopSettlement'         , ['base'])
        , ('0x3a6d8ca21d1cf76f653a67577fa0d27453350dd8', 'true', 'BiSwap'               , 'UNDEFINED'               , ['bnb'])
        , ('0x6f5ac65ca70f2a44d73c8f711cb2bdf425d9f304', 'true', 'BitKeep'              , 'UNDEFINED'               , ['bnb'])
        , ('0xf5bfcbda96de6a55a3a80af5175a1cbb088d5338', 'true', 'BitKeep'              , 'UNDEFINED'               , ['polygon'])
        , ('0xf6463845b0b9d9d33d8e2bcb6c628bc5cb1ad133', 'true', 'BitKeep'              , 'UNDEFINED'               , ['polygon'])
        , ('0xb099ed146fad4d0daa31e3810591fc0554af62bb', 'true', 'BoggedFinance'        , 'BogSwap'                 , ['bnb','avalanche_c','fantom'])
        , ('0xc873fecbd354f5a56e00e710b90ef4201db2448d', 'true', 'Camelot'              , 'CamelotRouter'           , ['arbitrum'])
        , ('0x1f721e2e82f6676fce4ea07a5958cf098d339e18', 'true', 'Camelot'              , 'SwapRouter'              , ['arbitrum'])
        , ('0xbf1fc29668e5f5eaa819948599c9ac1b1e03e75f', 'true', 'Cone'                 , 'ConeRouter01'            , ['bnb'])
        , ('0x11984dc4465481512eb5b777e44061c158cf2259', 'true', 'Connext'              , 'ConnextDiamond'          , ['polygon'])
        , ('0xee9dec2712cce65174b561151701bf54b99c24c8', 'true', 'Connext'              , 'ConnextDiamond'          , ['arbitrum'])
        , ('0x9008d19f58aabd9ed0d60971565aa8510560ab41', 'true', 'CoWSwap'              , 'GPv2Settlement'          , ['ethereum','gnosis'])
        , ('0x99a58482bd75cbab83b27ec03ca68ff489b5788f', 'true', 'Curvefi'              , 'SwapRouter'              , ['ethereum'])
        , ('0xbebc44782c7db0a1a60cb6fe97d0b483032ff1c7', 'true', 'Curvefi'              , 'ThreepoolSwap'           , ['ethereum'])
        , ('0xdc24316b9ae028f1497c275eb9192a3ea0f67022', 'true', 'Curvefi'              , 'StETHSwap'               , ['ethereum'])
        , ('0x1d8b86e3d88cdb2d34688e87e72f388cb541b7c8', 'true', 'Curvefi'              , 'VyperContract'           , ['polygon'])
        , ('0x43b4fdfd4ff969587185cdb6f0bd875c5fc83f8c', 'true', 'Curvefi'              , 'Vyper'                   , ['ethereum'])
        , ('0x0656fd85364d03b103ceeda192fb2d3906a6ac15', 'true', 'DODO'                 , 'DODOFeeRouteProxy'       , ['bnb'])
        , ('0x2fa4334cfd7c56a0e7ca02bd81455205fcbdc5e9', 'true', 'DODO'                 , 'DODORouteProxy'          , ['polygon'])
        , ('0x39e3e49c99834c9573c9fc7ff5a4b226cd7b0e63', 'true', 'DODO'                 , 'DODOFeeRouteProxy'       , ['polygon'])
        , ('0x3b6067d4caa8a14c63fdbe6318f27a0bbc9f9237', 'true', 'DODO'                 , 'DODORouteProxy'          , ['arbitrum'])
        , ('0x6b3d817814eabc984d51896b1015c0b89e9737ca', 'true', 'DODO'                 , 'DODORouteProxy'          , ['bnb'])
        , ('0xa222e6a71d1a1dd5f279805fbe38d5329c1d0e70', 'true', 'DODO'                 , 'DODOV2Proxy02'           , ['polygon'])
        , ('0xa2398842f37465f89540430bdc00219fa9e4d28a', 'true', 'DODO'                 , 'DODORouteProxy'          , ['ethereum'])
        , ('0xa8b034301bb5dd3610db585def3e7c0d52f2319f', 'true', 'DODO'                 , 'DODOFeeRouteProxy'       , ['bnb'])
        , ('0xe05dd51e4eb5636f4f0e8e7fbe82ea31a2ecef16', 'true', 'DODO'                 , 'DODOFeeRouteProxy'       , ['arbitrum'])
        , ('0x9d0950c595786aba7c26dfddf270d66a8b18b4fa', 'true', 'DfxFinance'           , 'Router'                  , ['ethereum'])
        , ('0xa102072a4c07f06ec3b4900fdc4c7b80b6c57429', 'true', 'Dfyn'                 , 'UniswapV2Router02'       , ['polygon'])
        , ('0x3af3cc4930ef88f4afe0b695ac95c230e1a108ec', 'true', 'Dzap'                 , 'DZapAggregator'          , ['polygon'])
        , ('0x0c6134abc08a1eafc3e2dc9a5ad023bb08da86c3', 'true', 'Firebird'             , 'FireBirdRouter'          , ['optimism'])
        , ('0x92e4f29be975c1b1eb72e77de24dccf11432a5bd', 'true', 'Firebird'             , 'FireBirdRouter'          , ['bnb'])
        , ('0xb31d1b1ea48ce4bf10ed697d44b747287e785ad4', 'true', 'Firebird'             , 'FireBirdRouter'          , ['polygon'])
        , ('0xe0c38b2a8d09aad53f1c67734b9a95e43d5981c0', 'true', 'Firebird'             , 'Firebird'                , ['fantom'])
        , ('0x9bc2152fd37b196c0ff3c16f5533767c9a983971', 'true', 'Fraxswap'             , 'FraxswapRouter'          , ['polygon'])
        , ('0x1b6c9c20693afde803b27f8782156c0f892abc2d', 'true', 'FstSwap'              , 'FstswapRouter02'         , ['bnb'])
        , ('0xb3ca4d73b1e0ea2c53b42173388cc01e1c226f40', 'true', 'FstSwap'              , 'UNDEFINED'               , ['bnb'])
        , ('0x3d6ba331e3d9702c5e8a8d254e5d8a285f223aba', 'true', 'GMX'                  , 'PositionRouter'          , ['arbitrum'])
        , ('0x5f719c2f1095f7b9fc68a68e35b51194f4b6abe8', 'true', 'GMX'                  , 'Router'                  , ['avalanche_c'])
        , ('0xa27c20a7cf0e1c68c0460706bb674f98f362bc21', 'true', 'GMX'                  , 'OrderBookReader'         , ['arbitrum'])
        , ('0xabbc5f99639c9b6bcb58544ddf04efa6802f4064', 'true', 'GMX'                  , 'Router'                  , ['arbitrum'])
        , ('0x83c8f28c26bf6aaca652df1dbbe0e1b56f8baba2', 'true', 'GemSwap'              , 'GemSwap'                 , ['ethereum'])
        , ('0x1c232f01118cb8b424793ae03f870aa7d0ac7f77', 'true', 'HoneySwap'            , 'UniswapV2Router02'       , ['gnosis'])
        , ('0xbd3bd95529e0784ad973fd14928eedf3678cfad8', 'true', 'Izumi'                , 'Swap0'                   , ['bnb'])
        , ('0xedf2021f41abcfe2dea4427e1b61f4d0aa5aa4b8', 'true', 'Izumi'                , 'Swap'                    , ['bnb'])
        , ('0x01fdea353849ca29f778b2663bcaca1d191bed0e', 'true', 'Izumi'                , 'Swap'                    , ['arbitrum'])
        , ('0x032b241de86a8660f1ae0691a4760b426ea246d7', 'true', 'Izumi'                , 'Swap'                    , ['polygon'])
        , ('0x943ac2310d9bc703d6ab5e5e76876e212100f894', 'true', 'Izumi'                , 'Swap'                    , ['zksync'])
        , ('0x02f55d53dce23b4aa962cc68b0f685f26143bdb2', 'true', 'Izumi'                , 'Swap'                    , ['base'])
        , ('0x2db0afd0045f3518c77ec6591a542e326befd3d7', 'true', 'Izumi'                , 'Swap'                    , ['scroll'])
        , ('0x8b791913eb07c32779a16750e3868aa8495f5964', 'true', 'KoiFinance'           , 'Router'                  , ['zksync'])
        , ('0x00555513acf282b42882420e5e5ba87b44d8fa6e', 'true', 'Kyber'                , 'AggregationRouterV3'     , ['fantom'])
        , ('0x1fc3607fa67b58deddb0faf7a116f417a20c551c', 'true', 'Kyber'                , 'AggregationRouter'       , ['fantom'])
        , ('0x546c79662e028b661dfb4767664d0273184e4dd1', 'true', 'Kyber'                , 'AggregationRouter'       , ['polygon'])
        , ('0x617dee16b86534a5d792a4d7a62fb491b544111e', 'true', 'Kyber'                , 'MetaAggregationRouterV1' , ['ethereum','polygon','fantom'])
        , ('0x6131b5fae19ea4f9d964eac0408e4408b66337b5', 'true', 'Kyber'                , 'MetaAggregationRouterV2' , ['ethereum','bnb','polygon','arbitrum','avalanche_c','fantom'])
        , ('0x6131b5fae19ea4f9d964eac0408e4408b66337b5', 'true', 'Kyber'                , 'MetaAggregationRouterV2' , ['optimism'])
        , ('0xdf1a1b60f2d438842916c0adc43748768353ec25', 'true', 'Kyber'                , 'AggregationRouterV2'     , ['polygon','fantom'])
        , ('0xb18d4f69627f8320619a696202ad2c430cef7c53', 'true', 'LevinSwap'            , 'UniswapV2Router02'       , ['gnosis'])
        , ('0x1231deb6f5749ef6ce6943a275a1d3e7486f4eae', 'true', 'LiFi'                 , 'DiamondV2'               , ['ethereum','bnb','polygon','arbitrum','avalanche_c','gnosis','optimism','fantom'])
        , ('0x62c1a0d92b09d0912f7bb9c96c5ecdc7f2b87059', 'true', 'Mdex'                 , 'MdexRouter'              , ['bnb'])
        , ('0x7dae51bd3e3376b8c7c4900e9107f12be3af1ba8', 'true', 'Mdex'                 , 'MdexRouter'              , ['bnb'])
        , ('0xbbf1ee38152e9d8e3470dc47947eaa65dca94913', 'true', 'Maverick'             , 'Router'                  , ['ethereum'])
        , ('0x39e098a153ad69834a9dac32f0fca92066ad03f4', 'true', 'Maverick'             , 'Router'                  , ['zksync'])
        , ('0xd53a9f3fae2bd46d35e9a30ba58112a585542869', 'true', 'Maverick'             , 'Router'                  , ['bnb'])
        , ('0x32aed3bce901da12ca8489788f3a99fce1056e14', 'true', 'Maverick'             , 'Router'                  , ['base'])
        , ('0x10f4a785f458bc144e3706575924889954946639', 'true', 'Meshswap'             , 'Router'                  , ['polygon'])
        , ('0x881d40237659c251811cec9c364ef91dc08d300c', 'true', 'MetaMask'             , 'MetaSwap'                , ['ethereum'])
        , ('0x1a1ec25dc08e98e5e93f1104b5e5cdd298707d31', 'true', 'MetaMask'             , 'MetaSwap'                , ['bnb','polygon','avalanche_c'])
        , ('0x9dda6ef3d919c9bc8885d5560999a3640431e8e6', 'true', 'MetaMask'             , 'MetaSwap'                , ['arbitrum','optimism'])
        , ('0x3c11f6265ddec22f4d049dde480615735f451646', 'true', 'Mimic'                , 'Swapper'                 , ['ethereum'])
        , ('0xd654953d746f0b114d1f85332dc43446ac79413d', 'true', 'NomiSwap'             , 'UNDEFINED'               , ['bnb'])
        , ('0x76f4eed9fe41262669d0250b2a97db79712ad855', 'true', 'Odos'                 , 'OdosRouter'              , ['ethereum'])
        , ('0x9f138be5aa5cc442ea7cc7d18cd9e30593ed90b9', 'true', 'Odos'                 , 'OdosRouter'              , ['bnb'])
        , ('0x69dd38645f7457be13571a847ffd905f9acbaf6d', 'true', 'Odos'                 , 'OdosRouter'              , ['optimism'])
        , ('0xa269031037b4d5fa3f771c401d19e57def6cb491', 'true', 'Odos'                 , 'OdosRouter'              , ['zksync'])
        , ('0x061dc8e41c05207bedd6242ea4b342ef294be359', 'true', 'Odos'                 , 'OdosRouter'              , ['fantom'])
        , ('0xa32ee1c40594249eb3183c10792bcf573d4da47c', 'true', 'Odos'                 , 'OdosRouter'              , ['polygon'])
        , ('0xdd94018f54e565dbfc939f7c44a16e163faab331', 'true', 'Odos'                 , 'OdosRouter'              , ['arbitrum'])
        , ('0xfe7ce93ac0f78826cd81d506b07fe9f459c00214', 'true', 'Odos'                 , 'OdosRouter'              , ['avalanche_c'])
        , ('0xcf5540fffcdc3d510b18bfca6d2b9987b0772559', 'true', 'Odos'                 , 'OdosRouterV2'            , ['ethereum'])
        , ('0x89b8aa89fdd0507a99d334cbe3c808fafc7d850e', 'true', 'Odos'                 , 'OdosRouterV2'            , ['bnb'])
        , ('0x4e3288c9ca110bcc82bf38f09a7b425c095d92bf', 'true', 'Odos'                 , 'OdosRouterV2'            , ['polygon'])
        , ('0xa669e7a0d4b3e4fa48af2de86bd4cd7126be4e13', 'true', 'Odos'                 , 'OdosRouterV2'            , ['arbitrum'])
        , ('0xca423977156bb05b13a2ba3b76bc5419e2fe9680', 'true', 'Odos'                 , 'OdosRouterV2'            , ['optimism'])
        , ('0x19ceead7105607cd444f5ad10dd51356436095a1', 'true', 'Odos'                 , 'OdosRouterV2'            , ['base'])
        , ('0x88de50b233052e4fb783d4f6db78cc34fea3e9fc', 'true', 'Odos'                 , 'OdosRouterV2'            , ['avalanche_c'])
        , ('0xd0c22a5435f4e8e5770c1fafb5374015fc12f7cd', 'true', 'Odos'                 , 'OdosRouterV2'            , ['fantom'])
        , ('0x4bba932e9792a2b917d47830c93a9bc79320e4f7', 'true', 'Odos'                 , 'OdosRouterV2'            , ['zksync'])
        , ('0x3b3ae790df4f312e745d270119c6052904fb6790', 'true', 'OKXDEX'               , 'DEX'                     , ['ethereum'])
        , ('0x6352a56caadc4f1e25cd6c75970fa768a3304e64', 'true', 'OpenOcean'            , 'ExchangeV2'              , ['ethereum','bnb','polygon','avalanche_c','optimism','fantom'])
        , ('0x05ff2b0db69458a0750badebc4f9e13add608c7f', 'true', 'PancakeSwap'          , 'PancakeRouter'           , ['bnb'])
        , ('0x10ed43c718714eb63d5aa57b78b54704e256024e', 'true', 'PancakeSwap'          , 'PancakeswapV2'           , ['bnb'])
        , ('0x5aeaf2883fbf30f3d62471154eda3c0c1b05942d', 'true', 'PancakeSwap'          , 'PancakeswapV2'           , ['zksync'])
        , ('0x13f4ea83d0bd40e75c8222255bc855a974568dd4', 'true', 'PancakeSwap'          , 'SmartRouter'             , ['ethereum','bnb'])
        , ('0x2f22e47ca7c5e07f77785f616ceee80c5e84127c', 'true', 'PancakeSwap'          , 'SwapSmartRouter'         , ['bnb'])
        , ('0x32226588378236fd0c7c4053999f88ac0e5cac77', 'true', 'PancakeSwap'          , 'SmartRouter'             , ['arbitrum'])
        , ('0xf8b59f3c3ab33200ec80a8a58b2aa5f5d2a8944c', 'true', 'PancakeSwap'          , 'SmartRouter'             , ['zksync'])
        , ('0xd4c4a7c55c9f7b3c48bafb6e8643ba79f42418df', 'true', 'PancakeSwap'          , 'ZapV1'                   , ['bnb'])
        , ('0xe54ca86531e17ef3616d22ca28b0d458b6c89106', 'true', 'PangolinExchange'     , 'Router'                  , ['avalanche_c'])
        , ('0x6b158039b9678b7452f311deb12dd08c579dad26', 'true', 'Paraswap'             , 'AugustusSwapperV0v1'     , ['ethereum'])
        , ('0x72338b82800400f5488eca2b5a37270ba3b7a111', 'true', 'Paraswap'             , 'AugustusSwapper'         , ['ethereum'])
        , ('0x59c7c832e96d2568bea6db468c1aadcbbda08a52', 'true', 'Paraswap'             , 'AugustusSwapper'         , ['base'])
        , ('0xf92c1ad75005e6436b4ee84e88cb23ed8a290988', 'true', 'Paraswap'             , 'AugustusSwapperV1'       , ['ethereum'])
        , ('0x86969d29f5fd327e1009ba66072be22db6017cc6', 'true', 'Paraswap'             , 'AugustusSwapperV2'       , ['ethereum'])
        , ('0x9509665d015bfe3c77aa5ad6ca20c8afa1d98989', 'true', 'Paraswap'             , 'AugustusSwapperV3'       , ['ethereum'])
        , ('0xf90e98f3d8dce44632e5020abf2e122e0f99dfab', 'true', 'Paraswap'             , 'AugustusSwapperV4'       , ['ethereum'])
        , ('0x1bd435f3c054b6e901b7b108a0ab7617c808677b', 'true', 'Paraswap'             , 'AugustusSwapperV4'       , ['ethereum'])
        , ('0x90249ed4d69d70e709ffcd8bee2c5a566f65dade', 'true', 'Paraswap'             , 'AugustusSwapperV4'       , ['polygon'])
        , ('0x55a0e3b6579972055faa983482aceb4b251dcf15', 'true', 'Paraswap'             , 'AugustusSwapperV4'       , ['bnb'])
        , ('0xdef171fe48cf0115b1d80b88dc8eab59176fee57', 'true', 'Paraswap'             , 'AugustusSwapperV6'       , ['ethereum','bnb','polygon','arbitrum','avalanche_c','optimism','fantom'])
        , ('0x00000000fdac7708d0d360bddc1bc7d097f47439', 'true', 'Paraswap'             , 'AugustusV6'              , ['ethereum','bnb','polygon','arbitrum','avalanche_c','optimism','fantom','base'])
        , ('0x000db803a70511e09da650d4c0506d0000100000', 'true', 'Paraswap'             , 'AugustusV6v1'            , ['ethereum','bnb','polygon','arbitrum','avalanche_c','optimism','fantom','base'])
        , ('0x135896de8421be2ec868e0b811006171d9df802a', 'true', 'Paraswap'             , 'LiquiditySwapAdapter'    , ['ethereum'])
        , ('0xe92b586627cca7a83dc919cc7127196d70f55a06', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['ethereum'])
        , ('0x0927fd43a7a87e3e8b81df2c44b03c4756849f6d', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['arbitrum','optimism'])
        , ('0x2DF17455B96Dde3618FD6B1C3a9AA06D6aB89347', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['fantom'])
        , ('0xa003dfba51c9e1e56c67ae445b852bded7ac5eed', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['base'])
        , ('0x34302c4267d0dA0A8c65510282Cc22E9e39df51f', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['avalanche_c'])
        , ('0x8DcDfe88EF0351f27437284D0710cD65b20288bb', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['bnb'])
        , ('0xF3CD476C3C4D3Ac5cA2724767f269070CA09A043', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['polygon'])
        , ('0x7Ee1F7fa4C0b2eDB0Fdd5944c14A07167700486E', 'true', 'Paraswap'             , 'AugustusRFQ'             , ['zkevm'])
        , ('0x82ac2ce43e33683c58be4cdc40975e73aa50f459', 'true', 'Perp'                 , 'ClearingHouse'           , ['optimism'])
        , ('0xa0069a14df3ecd19a38c509757ebc2c2aaa44992', 'true', 'Primex'               , 'SwapManager'             , ['polygon'])
        , ('0x2cf7252e74036d1da831d11089d326296e64a728', 'true', 'QuickSwap'            , 'UniswapV2Pair'           , ['polygon'])
        , ('0xa5e0829caced8ffdd4de3c43696c57f7d7a678ff', 'true', 'QuickSwap'            , 'UniswapV2Router02'       , ['polygon'])
        , ('0xf5b509bb0909a69b1c207e495f687a596c168e12', 'true', 'QuickSwap'            , 'SwapRouter'              , ['polygon'])
        , ('0x00000000009726632680fb29d3f7a9734e3010e2', 'true', 'Rainbow'              , 'RainbowRouter'           , ['ethereum'])
        , ('0xaaa87963efeb6f7e0a2711f397663105acb1805e', 'true', 'Ramses'               , 'Router'                  , ['arbitrum'])
        , ('0x37da632c6436137bd4d0ca30c98d3c615974120b', 'true', 'SafeMoon'             , 'UNDEFINED'               , ['bnb'])
        , ('0x0c17e776cd218252adfca8d4e761d3fe757e9778', 'true', 'Saita'                , 'SaitaSwapRouter'         , ['ethereum'])
        , ('0x90f765f63e7dc5ae97d6c576bf693fb6af41c129', 'true', 'Setprotocol'          , 'TradeModule'             , ['ethereum'])
        , ('0x03f7724180aa6b939894b5ca4314783b0b36b329', 'true', 'ShibaSwap'            , 'UniswapV2Router02'       , ['ethereum'])
        , ('0x00c0184c0b5d42fba6b7ca914b31239b419ab80b', 'true', 'SlingshotFinance'     , 'Swap'                    , ['optimism'])
        , ('0x07e56b727e0eacfa53823977599905024c2de4f0', 'true', 'SlingshotFinance'     , 'UNDEFINED'               , ['polygon'])
        , ('0x224b239b8bb896f125bd77eb334e302a318d9e33', 'true', 'SlingshotFinance'     , 'Swap'                    , ['bnb'])
        , ('0x5543550d65813c1fa76242227cbba0a28a297771', 'true', 'SlingshotFinance'     , 'UNDEFINED'               , ['arbitrum'])
        , ('0xe8c97bf6d084880de38aec1a56d97ed9fdfa0c9b', 'true', 'SlingshotFinance'     , 'Swap'                    , ['arbitrum'])
        , ('0xf2e4209afa4c3c9eaa3fb8e12eed25d8f328171c', 'true', 'SlingshotFinance'     , 'TradingContract'         , ['polygon'])
        , ('0x2b42affd4b7c14d9b7c2579229495c052672ccd3', 'true', 'Socket'               , 'Registry'                , ['avalanche_c'])
        , ('0xc30141b657f4216252dc59af2e7cdb9d8792e1b0', 'true', 'Socket'               , 'Registry'                , ['ethereum','polygon','arbitrum','gnosis','optimism'])
        , ('0xf26515d5482e2c2fd237149bf6a653da4794b3d0', 'true', 'Solidlizard'          , 'Router'                  , ['arbitrum'])
        , ('0xeeee17b45e4d127cfaaad14e2710489523adb4d8', 'true', 'Solisnek'             , 'Router'                  , ['avalanche_c'])
        , ('0x16327e3fbdaca3bcf7e38f5af2599d2ddc33ae52', 'true', 'Spiritswap'           , 'Router'                  , ['fantom'])
        , ('0x31f63a33141ffee63d4b26755430a390acdd8a4d', 'true', 'Spookyswap'           , 'LiquidityBrewer'         , ['fantom'])
        , ('0xf491e7b69e4244ad4002bc14e878a34207e38c29', 'true', 'Spookyswap'           , 'UniswapV2Router02'       , ['fantom'])
        , ('0x1b02da8cb0d097eb8d57a175b88c7d8b47997506', 'true', 'SushiSwap'            , 'SwapRouter'              , ['bnb','polygon','arbitrum','avalanche_c','gnosis','fantom'])
        , ('0x2c8c987c4777ab740d20cb581f5d381be95a4a4a', 'true', 'SushiSwap'            , 'SushiXSwap'              , ['avalanche_c'])
        , ('0x4c5d5234f232bd2d76b96aa33f5ae4fcf0e4bfab', 'true', 'SushiSwap'            , 'RouteProcessorV3'        , ['optimism'])
        , ('0x7a4af156379f512de147ed3b96393047226d923f', 'true', 'SushiSwap'            , 'SushiXSwap'              , ['bnb'])
        , ('0x8b396ddf906d552b2f98a8e7d743dd58cd0d920f', 'true', 'SushiSwap'            , 'SushiXSwap'              , ['optimism'])
        , ('0xd9e1ce17f2641f24ae83637ab66a2cca9c378b9f', 'true', 'SushiSwap'            , 'Router02'                , ['ethereum'])
        , ('0x2da10a1e27bf85cedd8ffb1abbe97e53391c0295', 'true', 'SyncSwap'             , 'Router'                  , ['zksync'])
        , ('0x80e38291e06339d10aab483c65695d004dbd5c69', 'true', 'SyncSwap'             , 'Router'                  , ['scroll'])
        , ('0xb9960d9bca016e9748be75dd52f02188b9d0829f', 'true', 'Swapr'                , 'Swapr'                   , ['ethereum'])
        , ('0xe43e60736b1cb4a75ad25240e2f9a62bff65c0c0', 'true', 'Swapr'                , 'DXswapRouter'            , ['gnosis'])
        , ('0x1342a24347532de79372283b3a29c63c31dd7711', 'true', 'Swaprum'              , 'V2Router02'              , ['arbitrum'])
        , ('0x1ed5685f345b2fa564ea4a670de1fde39e484751', 'true', 'Swftswap'             , 'SwftSwap'                , ['bnb'])
        , ('0x92e929d8b2c8430bcaf4cd87654789578bb2b786', 'true', 'Swftswap'             , 'SwftSwap'                , ['ethereum'])
        , ('0x03f34be1bf910116595db1b11e9d1b2ca5d59659', 'true', 'Tokenlon'             , 'Tokenlon'                , ['ethereum'])
        , ('0x079c68167f85cb06ed550149cce250e06dc3c52d', 'true', 'TraderJoe'            , 'SwapLogic'               , ['avalanche_c'])
        , ('0x60ae616a2155ee3d9a68541ba4544862310933d4', 'true', 'TraderJoe'            , 'JoeRouter02'             , ['avalanche_c'])
        , ('0xb4315e873dbcf96ffd0acd8ea43f689d8c20fb30', 'true', 'TraderJoe'            , 'LBRouter'                , ['bnb','arbitrum','avalanche_c'])
        , ('0xed8cbd9f0ce3c6986b22002f03c6475ceb7a6256', 'true', 'TraderJoe'            , 'JoePair'                 , ['avalanche_c'])
        , ('0x638f32fe09baec1fdc54f962e3e8e5f2b286aa70', 'true', 'TransitSwap'          , 'XswapProxyV3'            , ['bnb'])
        , ('0x8b48715c5d6d1645663a4c460ea85ce846b8580e', 'true', 'TransitSwap'          , 'UNDEFINED'               , ['polygon'])
        , ('0xb45a2dda996c32e93b8c47098e90ed0e7ab18e39', 'true', 'TransitSwap'          , 'TransitSwapRouterV4'     , ['bnb','polygon','arbitrum'])
        , ('0x00000047bb99ea4d791bb749d970de71ee0b1a34', 'true', 'TransitSwap'          , 'TransitSwapRouterV5'     , ['ethereum'])
        , ('0xf164fc0ec4e93095b804a4795bbe1e041497b92a', 'true', 'Uniswap'              , 'Router01'                , ['ethereum'])
        , ('0x7a250d5630b4cf539739df2c5dacb4c659f2488d', 'true', 'Uniswap'              , 'Router02'                , ['ethereum'])
        , ('0xe592427a0aece92de3edee1f18e0157c05861564', 'true', 'Uniswap'              , 'SwapRouter'              , ['ethereum','polygon','arbitrum','optimism'])
        , ('0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45', 'true', 'Uniswap'              , 'SwapRouter02'            , ['ethereum','polygon','arbitrum','optimism'])
        , ('0x0000000052be00ba3a005edbe83a0fb9aadb964c', 'true', 'Uniswap'              , 'UNDEFINED'               , ['ethereum'])
        , ('0xef1c6e67703c7bd7107eed8303fbe6ec2554bf6b', 'true', 'Uniswap'              , 'UniversalRouter'         , ['ethereum'])
        , ('0x3fc91a3afd70395cd496c647d5a6cc9d4b2b7fad', 'true', 'Uniswap'              , 'UNDEFINED'               , ['ethereum','bnb','polygon','arbitrum','optimism'])
        , ('0x5dc88340e1c5c6366864ee415d6034cadd1a9897', 'true', 'Uniswap'              , 'UniversalRouter'         , ['bnb'])
        , ('0x4c60051384bd2d3c01bfc845cf5f4b44bcbe9de5', 'true', 'Uniswap'              , 'UniversalRouter'         , ['polygon','arbitrum'])
        , ('0x643770e279d5d0733f21d6dc03a8efbabf3255b4', 'true', 'Uniswap'              , 'UNDEFINED'               , ['polygon'])
        , ('0xb555edf5dcf85f42ceef1f3630a52a108e55a654', 'true', 'Uniswap'              , 'UniversalRouter'         , ['optimism'])
        , ('0xec8b0f7ffe3ae75d7ffab09429e3675bb63503e4', 'true', 'Uniswap'              , 'UNDEFINED'               , ['bnb','arbitrum','optimism','base'])
        , ('0xb971ef87ede563556b2ed4b1c0b0019111dd85d2', 'true', 'Uniswap'              , 'UNDEFINED'               , ['bnb'])
        , ('0x2626664c2603336e57b271c5c0b26f421741e481', 'true', 'Uniswap'              , 'UNDEFINED'               , ['base'])
        , ('0x198ef79f1f515f02dfe9e3115ed9fc07183f02fc', 'true', 'Uniswap'              , 'UNDEFINED'               , ['base'])
        , ('0xe80bf394d190851e215d5f67b67f8f5a52783f1e', 'true', 'Uniswap'              , 'UniswapX'                , ['ethereum'])
        , ('0x6000da47483062a0d734ba3dc7576ce6a0b645c4', 'true', 'Uniswap'              , 'UniswapX'                , ['ethereum'])
        , ('0x9c12939390052919af3155f41bf4160fd3666a6f', 'true', 'Velodrome'            , 'Router'                  , ['optimism'])
        , ('0xa132dab612db5cb9fc9ac426a0cc215a3423f9c9', 'true', 'Velodrome'            , 'Router'                  , ['optimism'])
        , ('0x777777773fdd8b28bb03377d10fcea75ad9768da', 'true', 'Viarouter'            , 'ViaRouter'               , ['polygon','arbitrum','optimism'])
        , ('0xf29ace1fe5f36389d0dde450a0195a30c3770245', 'true', 'W3swap'               , 'W3swapRouterV2'          , ['bnb'])
        , ('0x5023882f4d1ec10544fcb2066abe9c1645e95aa0', 'true', 'Wigoswap'             , 'Router'                  , ['fantom'])
        , ('0x19609b03c976cca288fbdae5c21d4290e9a4add7', 'true', 'Wombat'               , 'WombatRouter'            , ['bnb'])
        , ('0x5aa6a4e96a9129562e2fc06660d07feddaaf7854', 'true', 'WooFi'                , 'WooRouterV2'             , ['avalanche_c'])
        , ('0xcef5be73ae943b77f9bc08859367d923c030a269', 'true', 'WooFi'                , 'WooRouterV2'             , ['bnb'])
        , ('0xdf37f7a85d4563f39a78494568824b4df8669b7a', 'true', 'WooFi'                , 'WooCrossChainRouter'     , ['avalanche_c'])
        , ('0xeaf1ac8e89ea0ae13e0f03634a4ff23502527024', 'true', 'WooFi'                , 'WooRouter'               , ['optimism'])
        , ('0xc4729e56b831d74bbc18797e0e17a295fa77488c', 'true', 'Yield'                , 'YakRouter'               , ['avalanche_c'])
        , ('0xdef1c0ded9bec7f1a1670819833240f027b25eff', 'true', 'ZeroEx'               , 'ExchangeProxy'           , ['ethereum','bnb','polygon','arbitrum'])
        , ('0xe66b31678d6c16e9ebf358268a790b763c133750', 'true', 'ZeroEx'               , 'ExchangeProxy'           , ['ethereum'])
        , ('0xdef189deaef76e379df891899eb5a00a94cbc250', 'true', 'ZeroEx'               , 'ExchangeProxy'           , ['fantom'])
        , ('0xdef1abe32c034e558cdd535791643c58a13acc10', 'true', 'ZeroEx'               , 'ExchangeProxy'           , ['optimism'])
        , ('0x080bf510fcbf18b91105470639e9561022937712', 'true', 'ZeroEx'               , 'ExchangeV2'              , ['ethereum'])
        , ('0x3f93c3d9304a70c9104642ab8cd37b1e2a7c203a', 'true', 'ZeroEx'               , 'ExchangeV2'              , ['bnb'])
        , ('0x145f83ad6108391cbf9ed554e5ce1dbd984437f8', 'true', 'ZeroEx'               , 'ExchangeV2'              , ['bnb','polygon'])
        , ('0x61935cbdd02287b511119ddb11aeb42f1593b7ef', 'true', 'ZeroEx'               , 'ExchangeV3'              , ['ethereum'])
        , ('0x18381c0f738146fb694de18d1106bde2be040fa4', 'true', 'ZkSwap'               , 'Router'                  , ['zksync'])
        , ('0xe7b0ce0526fbe3969035a145c9e9691d4d9d216c', 'false', 'Clipper'             , 'Clipper'                 , ['ethereum','arbitrum'])
        , ('0x655edce464cc797526600a462a8154650eee4b77', 'false', 'Clipper'             , 'Clipper'                 , ['ethereum'])
        , ('0xcc12532e95c2a6a4c53af153b9b739a3cc9218a7', 'false', 'Clipper'             , 'Clipper'                 , ['ethereum'])
        , ('0x6bfce69d1df30fd2b2c8e478edec9daa643ae3b8', 'false', 'Clipper'             , 'Clipper'                 , ['polygon'])
        , ('0xd01e3549160c62acabc4d0eb89f67aafa3de8eed', 'false', 'Clipper'             , 'Clipper'                 , ['polygon'])
        , ('0x69107c1fc1dbf486ea64ad4fe6f9be81b8265f92', 'false', 'Clipper'             , 'Clipper'                 , ['polygon'])
        , ('0x769728b5298445ba2828c0f3f5384227fbf590c5', 'false', 'Clipper'             , 'Clipper'                 , ['arbitrum'])
        , ('0x5130f6ce257b8f9bf7fac0a0b519bd588120ed40', 'false', 'Clipper'             , 'Clipper'                 , ['optimism'])
        , ('0xdbd4ffc32b34f630dd8ac18d37162ec8462db7db', 'false', 'Clipper'             , 'Clipper'                 , ['optimism'])
        , ('0xb32d856cad3d2ef07c94867a800035e37241247c', 'false', 'Clipper'             , 'Clipper'                 , ['base'])
        , ('0x32c85e56a82d66fa3c13e7df900682d63fcbaf89', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['ethereum','arbitrum'])
        , ('0xe2e3441004e7d377a2d97142e75d465e0dd36af9', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['ethereum'])
        , ('0x79cdfd7bc46d577b95ed92bcdc8ababa1844af0c', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['ethereum'])
        , ('0xedc827442114f038d009417a88942a619b8cfe17', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['polygon'])
        , ('0x5e8297efe1a5d9064f5dd3bb525d84807440a90d', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['bnb'])
        , ('0x3fff9a58676584ba28e8780366d7d9cef0eb78ce', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['bnb'])
        , ('0x375e05f6e12028e933ce598ad1bed7f1194ab071', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['bnb'])
        , ('0xacfaaa9da11e66a8cc8af8e3d844673968fff63f', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['polygon'])
        , ('0x8ee11bbd4139989e5f8bb92e8a9e01bc08df3011', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['polygon'])
        , ('0xab68b6213b091de92680ec57e879a20bbf12afda', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['arbitrum'])
        , ('0x6fce1a7c3347e78d22c278eb3a5c72ec8fcea294', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['arbitrum'])
        , ('0x36c543b8bb76b330ecb66a13c1c1377f889f1919', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['arbitrum'])
        , ('0x39b558bfc3c65230a5fa5170dbf7a44158a340f6', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['avalanche_c'])
        , ('0x43b4bf8758cae65e6b8242d2669e0e5e20ff693a', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['avalanche_c'])
        , ('0x45e817d12758ac37bc8dd3c71143c1be75e3ed6f', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['avalanche_c'])
        , ('0x54a06197130e02aa0244c4a413f70c52348c3610', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['optimism'])
        , ('0xfb1b9a97f1836173390d8bdeaf9004727311a8e1', 'false', 'Hashflow'            , 'HashflowRouterV1'        , ['optimism'])
        , ('0xf6a94dfd0e6ea9ddfdffe4762ad4236576136613', 'false', 'Hashflow'            , 'HashflowRouterV2'        , ['ethereum'])
        , ('0x0acffb0fb2cddd9bd35d03d359f3d899e32facc9', 'false', 'Hashflow'            , 'HashflowRouterV2'        , ['bnb'])
        , ('0x72550597dc0b2e0bec24e116add353599eff2e35', 'false', 'Hashflow'            , 'HashflowRouterV2'        , ['polygon'])
        , ('0x1f772fa3bc263160ea09bb16ce1a6b8fc0fab36a', 'false', 'Hashflow'            , 'HashflowRouterV2'        , ['arbitrum'])
        , ('0x64d2f9f44fe26c157d552ae7eaa613ca6587b59e', 'false', 'Hashflow'            , 'HashflowRouterV2'        , ['avalanche_c'])
        , ('0xb3999f658c0391d94a37f7ff328f3fec942bcadc', 'false', 'Hashflow'            , 'HashflowRouterV2'        , ['optimism'])
        , ('0x55084ee0fef03f14a305cd24286359a35d735151', 'false', 'Hashflow'            , 'HashflowRouterV3'        , ['ethereum','bnb','polygon','arbitrum','avalanche_c'])
        , ('0xca310b1b942a30ff4b40a5e1b69ab4607ec79bc1', 'false', 'Hashflow'            , 'HashflowRouterV3'        , ['optimism'])
        , ('0x3d130bf4686b3d4b6eb91a8e26ac629c5bea6082', 'false', 'Native'              , 'Native'                  , ['ethereum','bnb','arbitrum','avalanche_c'])
        , ('0xf39276d0eedfd604b55a0bd23c7ab2145ace4ab0', 'false', 'Native'              , 'Native'                  , ['ethereum','bnb'])
        , ('0x816ecda969e24583e79b71645f1202dabd7fe90e', 'false', 'Native'              , 'Native'                  , ['ethereum','arbitrum'])
        , ('0x5b0711eee0c6366aa35a98b14fd8b4b4c6d1d04c', 'false', 'Native'              , 'Native'                  , ['ethereum'])
        , ('0xf6b94770608ebf8b9b7621378cde5bc04b431cc8', 'false', 'Native'              , 'Native'                  , ['bnb','arbitrum'])
        , ('0xbd0180f7365a354b3b857c0ab16377c7bcdd2ec9', 'false', 'Native'              , 'Native'                  , ['bnb','avalanche_c'])
        , ('0x56385da1f6d17185402fe21795e0593837c8e991', 'false', 'Native'              , 'Native'                  , ['bnb'])
        , ('0x52a19f554882743b9e30968aafa48740979b141e', 'false', 'Native'              , 'Native'                  , ['bnb'])
        , ('0x63cb5b1d61e15dc31c80c787fe791baf1c81aec7', 'false', 'Native'              , 'Native'                  , ['bnb'])
        , ('0xd5473f6fb73422f416f01e096eefcc5af9894b71', 'false', 'Native'              , 'Native'                  , ['polygon'])
        , ('0x45b69fd499f068b7306d743d2f8b2ad5c54d99a0', 'false', 'Native'              , 'Native'                  , ['polygon'])
        , ('0x3151263101e0361b39cd6c530e45b28c33cbaf46', 'false', 'Native'              , 'Native'                  , ['polygon'])
        , ('0xd315a9c38ec871068fec378e4ce78af528c76293', 'false', 'Swaap'               , 'Vault'                   , ['ethereum','polygon','arbitrum'])
        , ('0xa57bd00134b2850b2a1c55860c9e9ea100fdd6cf', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0xa69babef1ca67a37ffaf7a485dfff3382056e78c', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x00000000003b3cc22af3ae1eac0440bcee416b40', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x0000000000007f150bd6f54c40a34d7c3d5e9f56', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x80d4230c0a68fc59cb264329d3a717fcaa472a13', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x0000000000005117dd3a72e64a705198753fdd54', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0xede2fafba9e23418485f49f052d0e1d332853e0f', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x018d5c4783f5317815f6e8168942a12adde3cd3c', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0xbadc0defafcf6d4239bdf0b66da4d7bd36fcf05a', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x860bd2dba9cd475a61e6d1b45e16c365f6d78f66', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x00000000c2cf7648c169b25ef1c217864bfa38cc', 'false', 'MEVBot'              , 'MEVBot'                  , ['ethereum'])
        , ('0x3d71d79c224998e608d03c5ec9b405e7a38505f0', 'false', 'Unknown'             , 'Unknown'                 , ['ethereum'])
        , ('0x78a55b9b3bbeffb36a43d9905f654d2769dc55e8', 'false', 'Unknown'             , 'Unknown'                 , ['ethereum'])
        , ('0x7dad75b50c0e78b34cc543e8632aa63f6a661bce', 'false', 'Unknown'             , 'Unknown'                 , ['polygon'])
        , ('0xc715ca10a7eb704af0847b860de4b1ea997fa3de', 'false', 'Unknown'             , 'Unknown'                 , ['polygon'])
        , ('0x0773edc0438b2ef18fc535b21d0ac77912c308c0', 'false', 'Unknown'             , 'Unknown'                 , ['polygon'])
        , ('0x403022af121cdca9c4acf4b94b2934429594ea29', 'false', 'Unknown'             , 'Unknown'                 , ['polygon'])
        , ('0x0773edc0438b2ef18fc535b21d0ac77912c308c0', 'false', 'Unknown'             , 'Unknown'                 , ['arbitrum'])
        , ('0x6a3e4b7e23661108aaec70266c468e6c679ae022', 'false', 'Unknown'             , 'Unknown'                 , ['arbitrum'])
        , ('0xf770c63b1764a9c8f0fa925044158b09855a7faf', 'false', 'Unknown'             , 'Unknown'                 , ['arbitrum'])
        , ('0x00000000001f8b68515efb546542397d3293ccfd', 'false', 'Unknown'             , 'ArbBot'                  , ['bnb'])
    ]
%}



with 
    
contracts as (
    select
        '{{blockchain}}' as blockchain
        , address
        , project
        , user
        , contains(array[
              '1inch'
            , 'BabySwap'
            , 'BoggedFinance'
            , 'Dzap'
            , 'Firebird'
            , 'Kyber'
            , 'LiFi'
            , 'Odos'
            , 'OpenOcean'
            , 'Paraswap'
            , 'SlingshotFinance'
            , 'TransitSwap'
            , 'ZeroEx'
        ], project) as multi
        , contains(array[
              '1inch'
            , 'ZeroEx'
            , 'Clipper'
            , 'Hashflow'
            , 'Native'
            , 'Swaap'
            , 'Paraswap'
        ], project) as lop
        , contains(array[
              '1inch'
            , 'CoWSwap'
            , 'Uniswap'
            , 'Bebop'
        ], project) as auction
        , tag
    from (values
        {% for row in config if blockchain in row[4] %}
            {% if not loop.first %}, {% endif %}({{ row[0] }}, {{ row[1] }}, '{{ row[2] }}', '{{ row[3] }}')
        {% endfor %}
    ) as c(address, user, project, tag)
)

, creations as (
    select
        '{{blockchain}}' as blockchain
        , address
        , min(block_time) as first_created_at
        , max(block_time) as last_created_at
        , max("from") as last_creator
        , max(tx_hash) as last_creation_tx_hash
    from {{ source(blockchain, 'creation_traces') }}
    group by 1, 2
)

-- output --

select
    blockchain
    , address
    , project
    , tag
    , map_from_entries(array[('user', user), ('multi', multi), ('lop', lop), ('auction', auction)]) as flags
    , first_created_at
    , last_created_at
    , last_creator
    , last_creation_tx_hash
from contracts
join creations using(blockchain, address)
order by project, blockchain, last_created_at, tag, address

{% endmacro %}