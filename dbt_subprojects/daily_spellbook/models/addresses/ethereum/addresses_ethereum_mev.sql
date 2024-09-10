{{config(alias = 'mev',
        tags=['static'],
        post_hook='{{ expose_spells(blockchains = \'["ethereum"]\',
                                    spell_type = "sector",
                                    spell_name = "addresses",
                                    contributors = \'["hildobby", "0xr3x", "sharples"]\') }}')}}

-- Source: https://etherscan.io/accounts/label/mev-bot

SELECT address
FROM (VALUES
    (0xeb4c5ab9b36437f969888be99af42fc9087005a5)
    , (0x0000000000036414940324055c43e75f56b7d016)
    , (0x0000000009cb38fb8a1bbb8ada23c8261118f019)
    , (0x000000000085359dbc0eb45911e5f3f7a532a07e)
    , (0x000000000000084e91743124a982076c59f10084)
    , (0x000000000a08a7ca00e4239dd97d8542c51b9086)
    , (0x0000007c68390193776e8b44df3b698d311070b9)
    , (0x00000000000123685885532dcb685c442dc83126)
    , (0x00000000003eea204b86b877632d9ee88b179150)
    , (0x000000004b614af95d1bb7c236a3aa800b722173)
    , (0x0000000000d41c96294ccdac8612bdfe29c641af)
    , (0x0000000084f794716fa5485d1424b8bd562291f9)
    , (0x00000000000c66b8cb2836c3620f88a9c812d208)
    , (0x0000000000b92ac90d898eba87fa5f2483f32234)
    , (0x00000000000a47b1298f18cf67de547bbe0d723f)
    , (0x0000000000a84d1a9b0063a910315c7ffa9cd248)
    , (0x0000004f2f05a8223b89edb700848d70970742bf)
    , (0x000000000dfde7deaf24138722987c9a6991e2d4)
    , (0x00000000f6e788341c1acb3c2d49fa9263b8a2f7)
    , (0x0000000050fd1220ecf21d84687ebad194fd537f)
    , (0x000000000b8a22fdae0233faa785df7974ff0391)
    , (0x0000000000710a9c1f6db5f504be77ffb3b583ec)
    , (0x000000004b5ad44f70781462233d177d32d993f1)
    , (0x0000000000208d4805eb97db796e74b48547445d)
    , (0x000000000000660def84e69995117c0176ba446e)
    , (0x000000000003c42172c0bdd69d6afb6b0bf4b488)
    , (0x000000000025d4386f7fb58984cbe110aee3a4c4)
    , (0x0000000096b674bb0ea9c74c28be782bb48724de)
    , (0x000000000000f0bc41c73af48f022f8c27b5350e)
    , (0x0000000000cbba74c365869ae50225f5596ad59c)
    , (0x00000000b7ca7e12dcc72290d1fe47b2ef14c607)
    , (0x00000000726422a6fecb4759b44d47e48cf746aa)
    , (0x000000dce08f643423c0bec02b0799e37f076781)
    , (0x00000000000080c886232e9b7ebbfb942b5987aa)
    , (0x00000000000062f06c7007906b2a4034fa5c4818)
    , (0x000000005736775feb0c8568e7dee77222a26880)
    , (0x00000000c2cf7648c169b25ef1c217864bfa38cc)
    , (0x0000000000d9455cc7eb92d06e00582a982f68fe)
    , (0x00000000002d383933aa1609f11d0afa4d5ea90a)
    , (0x000000000035b5e5ad9019092c665357240f594e)
    , (0x00000000116579a5ba59e2f22e77ede26809b970)
    , (0x0000000099cb7fc48a935bceb9f05bbae54e8987)
    , (0x00000000005b84b558de194b242f92b11f1469ca)
    , (0x0000000089341e263b85d84a0eea39f47c37a9d2)
    , (0x00000000000f45b418291a68f2646d0b1a303a1c)
    , (0x00000000003b3cc22af3ae1eac0440bcee416b40)
    , (0x00000000500e2fece27a7600435d0c48d64e0c00)
    , (0x0000000000e4cc48a5427ca0b9ed03b5bc501c97)
    , (0x0000000dc0cc877153e7e93870ad2a3382e99ca0)
    , (0x000000000042c71e9b847fb1533270360a7b2cbf)
    , (0x0000000765306855601b70d930ac579b23a18d44)
    , (0x0000000000005117dd3a72e64a705198753fdd54)
    , (0x000000a60073b3ab5258ec72f46c002ad912ed76)
    , (0x000000090629d24e9ebbd5bb2a714f21ecd6ed9a)
    , (0x00000000009c7f96284472465e1b5c44e8cfcda1)
    , (0x00000000000e1d0dabf7b7c7b68866fc940d0db8)
    , (0x0000000000590b74eb97457bf7b3ff6d63c6fde2)
    , (0x00000000032962b51589768828ad878876299e14)
    , (0x00000000008c4fb1c916e0c88fd4cc402d935e7d)
    , (0x000000000000006f6502b7f2bbac8c30a3f67e9a)
    , (0x0000000000000eb4ec62758aae93400b3e5f7f18)
    , (0x0000000000007f150bd6f54c40a34d7c3d5e9f56)
    , (0x000000000755567f4924bf483bdf5a53ebc8ef64)
    , (0x0000000000a18ba8ff557c143927bd3b2593bf7a)
    , (0x0000000000126f0ba49fbb414edc7041d1166ff4)
    , (0x00000081c57cbc967248bea482c417207e84cffb)
    , (0x0000e0ca771e21bd00057f54a68c30d400000000)
    , (0x0055ae46f700bcc53b1b00483d64000d47007200)
    , (0x00f3f73f07d9e9e797b82b00536e010018000000)
    , (0x018d5c4783f5317815f6e8168942a12adde3cd3c)
    , (0x01a1527a5127f721a4c9ff955c93f6faef2f6deb)
    , (0x01ba6660c1bf555cc1455a961dc8b4e5a95b0159)
    , (0x030d1cad9f917cab7356b6a266f8ea0b31093ae1)
    , (0x04eb85ad427e7e6b3ffb67e049872210fd3fbae9)
    , (0x05e31b564e800d7da3389b1fb37835fc4bdb6fbf)
    , (0x07197a25bf7297c2c41dd09a79160d05b6232bcf)
    , (0x098fdb32ace942edc1355c0a78af2332b1ec6fef)
    , (0x0a482d6499a3ea0d01bc60e42e6f1774ca7faf60)
    , (0x0bd30c34e4524df28d368d00c2feb534696d0bb7)
    , (0x0c3de458b51a11da7d4616f42f66c861e3859d3e)
    , (0x0eae044f00b0af300500f090ea00027097d03000)
    , (0x0ef8b4525c69bfa7bdece3ab09f95bbf0944b783)
    , (0x1316abcc2ab4ce7e937cd27707c54f6f6688a91b)
    , (0x195acb4ef662cbae48db6a26c88b603c65090803)
    , (0x1bea639199d4d37f4307b0e4441f4479bd9970e9)
    , (0x1d6e8bac6ea3730825bde4b005ed7b2b39a2932d)
    , (0x1ebadd3e0bb6d4e9edb574c5f0b0edc23c815d95)
    , (0x2242a7461c7bbd9202a97e967a0fbb8336ac863d)
    , (0x294e453c3f5758e562aa13c76ec376c70c0bdbad)
    , (0x2ad9142941514c9550fd5d1b20baf9cb93a86847)
    , (0x2d0f3b2abe9d61a21812023bb28cd2da7c3f30b9)
    , (0x2f1d79860cf6ea3f4b3b734153b52815773c0638)
    , (0x33f4c006e6541cbaa3179b0978143e3ac3d70220)
    , (0x3445c9ee4d17ba579061beec736f81b6d96754cd)
    , (0x35137b4c325c115a704cd23d5f2faf8777370d06)
    , (0x3700006fbcde59a8b3af2c134d00e9530000e379)
    , (0x3773e380e06c6ec156116f77021862c45c6022bb)
    , (0x39dbb8f23001445e43c269f1246809091be7da60)
    , (0x39ee28ec61a63147fc822b9e40757be530eefa65)
    , (0x3af4ea5614f21e23b2398a62e1e20fe3d8b2fb7f)
    , (0x3b654e30633d44b05847aaf65cf1ad0c92bed248)
    , (0x4024fe8187f0f31e72914a7d5014b29a88f07747)
    , (0x4083d4ef32631ed3394cc1b11efb03ceebcd2f6c)
    , (0x40e645bc65035286de2009d717365d9640cc2b09)
    , (0x42b2c65db7f9e3b6c26bc6151ccf30cce0fb99ea)
    , (0x43f2dfc9f99eba7a52fdffe7f3ea2182324e8896)
    , (0x44ccdcd59984848a749e9f999b08f2b68153e123)
    , (0x456804481f237bbb1b0baf5bd606d481ad672048)
    , (0x45716d9eddbc332df1d42b9f540fbebed671b20f)
    , (0x467c197bf259fe46232c142acda389fc0795c7f4)
    , (0x46aa587c29aef0c5ca51e8e5716dc1be822d6f46)
    , (0x46c4128981525aa446e02ffb2ff762f1d6a49170)
    , (0x49307d775728daf1d4736ab762de0cefd035e323)
    , (0x498e84899558545a0f6d4036bdb3a3842cf9b6d0)
    , (0x499dd900f800fd0a2ed300006000a57f00fa009b)
    , (0x4a137fd5e7a256ef08a7de531a17d0be0cc7b6b6)
    , (0x4a47615f0b239063992dddbee6844033c172f2b6)
    , (0x4cadecc51feb5c1f6d9a902ecc817a1b8c2246f9)
    , (0x4cb18386e5d1f34dc6eea834bf3534a970a3f8e7)
    , (0x4d246be90c2f36730bb853ad41d0a189061192d3)
    , (0x4d638adb8c07a78655e9ae88641c4202774e6584)
    , (0x4fce027bc57d7530b84527f4848983cece4df15e)
    , (0x507888e987257a8dde6f8afa46375cefe2cbf504)
    , (0x51399b32cd0186bb32230e24167489f3b2f47870)
    , (0x5492a302991751fd6b5c051d85be48acc9fec4d3)
    , (0x553eea17185e5ae6bb72f9528a4c3fc1a844b859)
    , (0x55eb58655f8202ff839487886fedba2a1eb7b2d7)
    , (0x563bdabaa8846ec445b25bfbed88d160890a02ed)
    , (0x57c1e0c2adf6eecdb135bcf9ec5f23b319be2c94)
    , (0x5aa3393e361c2eb342408559309b3e873cd876d6)
    , (0x5cacdfb236e4bfdd5f9ed992a998cc99aed5b4d9)
    , (0x5e767aa6204ece873c7d9405c4bca49cd3e0bf39)
    , (0x5f05a1e43e738efcd5227e65660a874050dda64c)
    , (0x60a1d9d5f6346aae41a18b08dcd0be48a74a3021)
    , (0x634ccb596def40fad8dde810a8f98d286a2a5b27)
    , (0x66f049111958809841bbe4b81c034da2d953aa0c)
    , (0x689209519e78947d52b862748e059fad1238d689)
    , (0x696713eaba8d603bab45e2c5820ef4c175c7a5e8)
    , (0x6af1a16fde7346e7729fa921ad2ddf6a462061e2)
    , (0x6b58007b960016b2f559dbfd809ac4dcb1febdfe)
    , (0x6d660980b00c3405c2dec173cf2259b15572b9b5)
    , (0x6ed51e4acca56d74076cdeb58337225b8aaf4abc)
    , (0x6ee33c4a192118ea664612aec6f7b6e4aef78b87)
    , (0x70d772361eb567eb45da56e147e5224e2abedeba)
    , (0x72bd67d7406d0c490b0ad0b8968f4beccdd494db)
    , (0x731ea79a1b2b90683507da2aab498bd8ff8f7ff1)
    , (0x73f78d23370386cbcecd24ab3fa5da63be80f0e8)
    , (0x7436a14a8dbf6eba14f114cb71a3b6d4527b222a)
    , (0x74d8353a2ce55b41828075f406b0e42001bcd00b)
    , (0x761d80987a36fc271875ea4de17539e8c82ae51d)
    , (0x7719494eb8f3ca261f5c806d754853dc5ce2edf7)
    , (0x7777777580290cede6e2121b846023fa1a1e4978)
    , (0x77b285fbdb277e53ed29c9dda7c0aa6f2591b09d)
    , (0x793ff66b5435a6de9d6d7e70c4c68522e8cd24e1)
    , (0x79dd6397b1ce40d6ac14f361ff9f9836d0cff6e1)
    , (0x7c2347f23e11310e976532ff606688a57a77a535)
    , (0x7cf09d7a9a74f746edcb06949b9d64bcd9d1604f)
    , (0x7e00009e6d00258407c50094680080f5830a00d9)
    , (0x7f9a1c279e8bdbb326e453aebb3abba140458362)
    , (0x8032eaede5c55f744387ca53aaf0499abcd783e5)
    , (0x80d4230c0a68fc59cb264329d3a717fcaa472a13)
    , (0x811213d2d0e26ecf65714074cef59119dd7f36d9)
    , (0x81153f0889ab398c4acb42cb58b565a5392bba95)
    , (0x815b2ad3c669df996fc55a9472ad251312476898)
    , (0x828a2d99bb1a31ca0eba80f3e01db8dae652a1e3)
    , (0x83d159b6e661f7f7e56ee3cd35d8b45f73187967)
    , (0x842b9aa0e8e6eb77f16782bd27cb02a97002c4fc)
    , (0x8472ee188899569cf6ef42bb2038facae66972d2)
    , (0x84783f7e102ac1e28abe254c7c27d4c01891ca2e)
    , (0x85db6b36e3d7704d7f747430124af1af33c35ee1)
    , (0x85e5c6cffd260a7f153b1f34b36f6dbeba3e279e)
    , (0x860bd2dba9cd475a61e6d1b45e16c365f6d78f66)
    , (0x8698d9d5ea99809c00426484a80be2add4e54581)
    , (0x8788a7cfd63cf06d0d7716c6a66f54b58248c896)
    , (0x87d9da48db6e1f925cb67d3b7d2a292846c24cf7)
    , (0x8a9bc155740b096575bfe1ee80f5783eefbbf1d2)
    , (0x8aff5ca996f77487a4f04f1ce905bf3d27455580)
    , (0x8b3400cf2dd7aa70f26b8a28b70c1d707e7945ff)
    , (0x8b46e02e2ce66c041ddebeed9734a8deebf1a3ab)
    , (0x8c3635482f23bd108cfd941736fd15fbd59d53bc)
    , (0x8e60b2b96ea901beb2cafd79b8d0ed249a5efd95)
    , (0x8f44e22ac221cc25a46289d1c307d4f34a4dd6c2)
    , (0x91000060399502550000007bbfba0052f47b008a)
    , (0x911605012f87a3017322c81fcb4c90ada7c09116)
    , (0x98c3d3183c4b8a650614ad179a1a98be0a8d6b8e)
    , (0x99999999d116ffa7d76590de2f427d8e15aeb0b8)
    , (0x9a0ef593dcc6a77f80699c9fa00d1e138b67d832)
    , (0x9aa954706326d900fd55e0928a92e3b93ad34dc9)
    , (0x9be4dd4724d9f13cc05ce25416d9f9bfccd443e0)
    , (0x9e244643b91ecc1498718cb4f5d22d14a9b121a1)
    , (0x9e9346e082d445f08fab1758984a31648c89241a)
    , (0xa1ba2e31d3b58c44293e54a90aaa817b14304e07)
    , (0xa57bd00134b2850b2a1c55860c9e9ea100fdd6cf)
    , (0xa69babef1ca67a37ffaf7a485dfff3382056e78c)
    , (0xa75af537fb853bb432f6a51d47d70e349fffc6ba)
    , (0xac9df97f9cd7a5f66913d107cddd00f40ac9ab4c)
    , (0xacd4ec996aad815efe72a11944188c6db6c30176)
    , (0xaf9642bc3b0daf66a8930d17b99865944df4d60b)
    , (0xb3fcd22ffd34d75c979d49e2e5fb3a3405644831)
    , (0xb4247d5978060387c0fe91d13a90d5711f65b7ce)
    , (0xb4990d3044641456a2509ed0bd709f1176a6a7af)
    , (0xb5c7ad3cb6506c65da01f2fac2e667dcb9e66e9c)
    , (0xb807aca3615bb8c93d32d7fb418e69370e1a7c86)
    , (0xb91d9b045f8a64bca4c69625b00001109932be34)
    , (0xba71b56fd0b590ed2a6992ed57a34c1391940513)
    , (0xbadc0defafcf6d4239bdf0b66da4d7bd36fcf05a)
    , (0xbb5acd74d889da9102d97d5a14de49e6ce710851)
    , (0xbe69dde0a051e72e18871be52cf506e419058f11)
    , (0xbeefbabeea323f07c59926295205d3b7a17e8638)
    , (0xbf971824421fa3778cb638bdeb79b8d5223e0fe6)
    , (0xbfef411d9ae30c5b471d529c838f1abb7b65d67f)
    , (0xc1374db508b7a3e0cdf061c8d8c1f7a260f231cd)
    , (0xc21b472e150669a9e20a1233cad67eced2851ec5)
    , (0xc2a54f74ebbbba5ed92d6a0b5dcb0b0ffb96f36e)
    , (0xc358848e138ab73bd5b9ffcced25517f71101fb0)
    , (0xc4595e3966e0ce6e3c46854647611940a09448d3)
    , (0xc5ecee6d94f72b6c456e3032f383284cca36b70a)
    , (0xc8046263d5b5544f6413a98b4693488499195a46)
    , (0xc83d02d366b882202828f47a1c6fecb8fee1192e)
    , (0xc90bffb8955e2d69780de7a43a11cf113d5e476d)
    , (0xcadf4ffa3c2fc4784ba064928f403aee7b02d80e)
    , (0xcb3a0940df2781ed8c0d07c536f7cc39ed4d933b)
    , (0xcbd75d63f98c5ff5d7157edf06abef8a8325c24d)
    , (0xcd9e13b2f3bfc26cd99989fb849a2751932595c4)
    , (0xcf99a481076186a44070c3158cf75c8cf00f84fc)
    , (0xd234ca832efbd43819dcc96e25d0586d4e5d976f)
    , (0xd241ed81b52a1b67098072b73f22fda9d253e827)
    , (0xd434cea7207d2e330dd1129d777191dee6b7c37d)
    , (0xd59e5b41482ee6283c22e1a6a20756da512ffa97)
    , (0xd89a0a4f088d9e47710e14257d4c5a7f9fd63c6d)
    , (0xd8c07491caa1edf960db3ceff387426d53942ea0)
    , (0xd911560979b78821d7b045c79e36e9cbfc2f6c6f)
    , (0xdd28d64e40e00af54a0b5147539a515c4a0bc1c5)
    , (0xdd4d3ed43e53185f4dbc467151ab2cb3142def52)
    , (0xdfee68a9adb981cd08699891a11cabe10f25ec44)
    , (0xdff523be6002e59a4a2242d99afccb502d4ed020)
    , (0xe06ffa8146bbdeccbaaf72b6043b29091071aeb8)
    , (0xe07025d4ce7881b7f50d4d6b954e43590dcb1092)
    , (0xe0a9efe32985cc306255b395a1bd06d21ccead42)
    , (0xe1f08d771fb7b248b3266b7f79a9eafba3147c2d)
    , (0xe35f24470730f5a488da9721548c1ab0b65b53d5)
    , (0xe37b5e4de6c4c6e3a1b5d914722a7daaf37590d0)
    , (0xe8c060f8052e07423f71d445277c61ac5138a2e5)
    , (0xe9137b423713667f6c3ac6565b81aa005640212c)
    , (0xede2fafba9e23418485f49f052d0e1d332853e0f)
    , (0xeef86c2e49e11345f1a693675df9a38f7d880c8f)
    , (0xef1de056b83032d6d19796ef85e7e60d72281968)
    , (0xef6e90098e54aa0cbb26c5cc68e040a59fad8758)
    , (0xf1243ea5b8b1ec27ee03c1c158a86470726e2905)
    , (0xf17131e60edb07d73f812058d50992639987665b)
    , (0xf2a0aaecaeef1a00d1eb6178fb30de5695519abf)
    , (0xf3b2d1395cb4536a931b2fa53dc7687e4c6f5411)
    , (0xf6d78d9c50ffbc2917e374fd185b8ff89c55effc)
    , (0xf71530c1f043703085b42608ff9dcccc43210a8e)
    , (0xf7c517e7e545d8f3286d336372b65995b81b91c2)
    , (0xfbf6b914a5c1355db7a6aa63df81f24aca987358)
    , (0xff2fbc735d33ae830f056107f1b551783ec4ed5b)
    , (0xff62dfadca3b5643d0b283571fe154d886580c0c)
    , (0x93f9a668dccc090f63b0ec27d809527dc2f0ebba)
    , (0x64eb3f16bcc7cf02d4d9ace45535bf90ccb1d324)
    , (0x6b75d8af000000e20b7a7ddf000ba900b4009a80)
    , (0xaddce577484aa0806a668e814bc0aa3624698c3a)
    , (0x1fb421310ceacd0afb2a429bbb4682e522b38ecb)
    , (0xbf17ca35f34932aa7ed21b2ccdd90ceba190be40)
    , (0xc412560803c267517b6453103db75e231bd925df)
    , (0x86ecd42504fead01409901f41cda45a0f8c54e71)
    , (0xc5b97cc7718bc82cee93143d26fcfce2b6db96fd)
    , (0xda1ee2f81e5fc1c242343141f82ae3ac748e84aa)
    , (0x91d63ec594be1d1cf809682688c69a6ae3cb83f7)
    , (0x6f2b0237841de68dd6c3de2616fc8459a83d3615)
    , (0xe9cbfec52ef797624ed941b0ed157607560f5167)
    , (0xefe8abfb9684f621acc2524b841ead4a712e1fbb)
    , (0x875012b086cca9976463e18ea1d76b6c5e43e487)
    , (0x00000000a991c429ee2ec6df19d40fe0c80088b8)
    , (0xa0cdf33c150b936d0091969c694da3cfeae18446)
    , (0xc35d77d25d81be78ad60ce14fea7c92d438782e3)
    , (0x2ed5003ebb8c00002c20000d00004b3500f4398b)
    , (0x053f661abf26d086194540f20f312e0d90a61302)
    , (0x0000000023191c8382251c0a1ae2f4db983d414c)
    , (0x063256feb7d31177d4a65f5b7e1d70fde85bc99d)
    , (0x00000000cce816c69bfb52ffa225cb1f3ee04c71)
    , (0x63deabf35a837314849d8be3e4557307a9f16a09)
    , (0x493f461aead031cee2027f1b95370a692611acb9)
    , (0x000000000017ccc71033cfacf601232002591831)
    , (0x45f02235cb7f59122a813a19274ef6b2c0ca70c6)
    , (0x6f87f1fbf96c1bb0b0cc9bf6a456566919900d3e)
    , (0xf332720d9daded8da18740851dc38b84d0d74742)
    , (0x65ab5193c173ce757c18d485c2812ed61df37080)
    , (0xd7f3fbe8c72a961a5515203eada59750437fa762)
    , (0xd050e0a4838d74769228b49dff97241b4ef3805d)
    , (0x548dd74ff71a2070f2495076e73834576b8d50c1)
    , (0x775c559d9a48ce5a8444c1035c3a8921ab477b8e)
    , (0xe0966747fa192d165414d76f016ce9aafc153bf8)
    , (0x3c0756ba2b1d702f8f63629555625b11be81546f)
    , (0xcfd4176f7975c70f800d87aeaca316270521595a)
    , (0xc5fba88735f1944c44a5fa96070a41461f37dbb1)
    , (0x0000000f9c4e004706afdca3b2f0c8f08838eb58)
    , (0xeeaa83b2d581a3a790774d4dae7bf354fffe3376)
    , (0xbd519007f706981781128624169ca574cc232980)
    , (0x9dd864d39fbfdf7648402746263e451cd4f36af0)
    , (0x445947140f5e1b742439f6ee24a7690d077bbb89)
    , (0xc8b2bc817d049d2307cabf6eacbbc2603b011acf)
    , (0xcec7be682732877075b1f04575bd13a221e32ecb)
    , (0xc7f23c771883d363638450dc07c56a6e494bc3a9)
    , (0xc38e6c5a5ee6a4dcb05d864c4112341bc9daef9e)
    , (0x00000000000747d525e898424e8774f7eb317d00)
    , (0xb4262e8560f874ddb0a508fb5c13b5cdb673acee)
    , (0x247b69f78d2a590bec1ac0a4a4066debe3fca2b8)
    , (0x9ea3cda5c2adf0370454b9ee28786a068227b1a4)
    , (0xe756c0dd3e09f50b1d912826eef4b4751bdf9e8c)
    , (0xbee161c7ee275cc3c665bfc5370301b84cb4c356)
    , (0xc758d5718147c8c5bc440098d623cf8d96b95b83)
    , (0x7d00a2bc1370b9005eb100004da500924600a2e1)
    , (0xf249cec5882bf45c028550de230aeb1a8f905597)
    , (0x9f5d5f14a17c68c12b956d3fd73b8adc32fe0bc6)
    , (0xc1f4f106273a82d6ced74550292b24cdde958fd8)
    , (0xb0bababe78a9be0810fadf99dd2ed31ed12568be)
    , (0x12b6eba545e4a9666cb7a77d1da25df9ffb172f3)
    , (0x52a8aa269bea924379d08945c351232c5cc41581)
    , (0x0000000000e43e0c383403dd18066ff60d5003b3)
    , (0xe08beb8c48e71fd08560db2fbaaa0701b187c7a7)
    , (0x41f6b7bef8831b2e1b8343153ea664ce938c08ed)
    , (0xcda3d75a1a247bf3fa9efd0727db54d7cf0c90c2)
    , (0x43cc953fb952d10c8f810267092fb12145d56d40)
    , (0x3e2766167aa2acb097c311d5a2e9eb17cad38b06)
    , (0x3d31b3f71b338b0cc4ce0ba9f376196b692e6411)
    , (0xc11ce44147c9f6149fbe54adb0588523c38718d7)
    , (0x4ddbf6140cedfcb2bd75874f9d82d60715e44086)
    , (0x6c6b87d44d239b3750bf9badce26a9a0a3d2364e)
    , (0x273ed890a071a566bc38fe3d3ae415e429532303)
    , (0x09d5dad5a97e0431b974b211fc0082efb172cab7)
    , (0xbb552d1c03268594b673112009cdd46de0d3a02c)
    , (0x52ca1cb9fc6fbd1cfe5630e74de8738b517a367a)
    , (0x33a330a68d824bf56c7dbc42d4cd827368441321)
    , (0x7293035f0eade9919a14b26702050c01e58b15f1)
    , (0xb6569481dccddd527c2b0e8ba32f494e52224ca1)
    , (0xeb00c80f00ca1585000000b84f00940000ed40e5)
    , (0xa1dd4a2dce5cbaff022685a30ac7970ade5322eb)
    , (0x07bae765074790b76c791834ab873be27493c163)
    , (0x14fcc715dfa45f9a2790e85d7f54cd06b5f61b07)
    , (0x000000d2fde48b949e34473ba3244763c4c0e43b)
    , (0x160f5f00288e9e1cc8655b327e081566e580a71d)
    , (0x34744e2c314fb4e59c16afb7a8bd3c87e0389309)
    , (0x89633a6d12200f0ad9ad2219782adf0f54e9065c)
    , (0x7efd91c8ca31e7452c5c4de00a8ca1c18910a35f)
    , (0x93680291442381845d043e222790203ed34d20f4)
    , (0x5463f5758093e6f5b33b13eaee4ca8ec2753733c)
    , (0x48802e0ce5045beb5f00e19dab7174384c7e5b35)
    , (0x000000000005af2ddc1a93a03e9b7014064d3b8d)
    , (0xf8b721bff6bf7095a0e10791ce8f998baa254fd0)
    , (0x7a70e27e10dc7e860bc92e0817b64feab4c777d3)
    , (0x43f53cc7eaa8526601a28eb7130b153d5c5fcc4f)
    , (0x7b577a879665ef6ad344da61de7ec2371f6ff68f)
    , (0xba3f5c056500ce033e9d74494b820d495efcf19d)
    , (0x499ac6f42c3d92a381437b63735ef7b547c31022)
    , (0x03c609c569993913aab877a94c8e58aec13e67cc)
    , (0x000000d40b595b94918a28b27d1e2c66f43a51d3)
    , (0x0bff3f4dd1adf7355353079d99a836443a49811b)
    , (0xf63c1cb797b78b54780df7efdf35378442d8392a)
    , (0x1e1efdc771a99dd892c10ef24d565149b337f210)
    , (0xc0d0144f7887ae4d756270219d67f2de603193eb)
    , (0x585c3d4da9b533c7e3df8ac7356c882859298cee)
    , (0x274700009ed289003a8650db7200c50060f00000)
    , (0x818a81cc5a577092c9457884facbd7d69b82540a)
    , (0x21dec254be248af0293a3c4f5bdb06d77c7e9e07)
    , (0xed77777586d73c58eb4d6bebdf9c85c2d5f56c2d)
    , (0x8385c093657503aebd55bac4a9bb0df5d3528835)
    , (0x6db01031355fbf8eea0c06a5d56217ba1967f0df)
    , (0x54eeb92cf8ad49c2cb4dc8c9eb5dc9538836016b)
    , (0x00000007f7a9056880d057f611e80c419f9b20c8)
    , (0xbf61595c0f53f01e92cc210663dccd7ab237b1d9)
    , (0x0b22bf9516db5bcd0070b9f27ce22de9b31d99f6)
    , (0x5df6434986b285143b060c0e07e1a8d79f5d1b8b)
    , (0x5050e08626c499411b5d0e0b5af0e83d3fd82edf)
    , (0x5dbb2765a9f0016889066ce3dc41a91879ca30de)
    , (0x7404c78fc91908ee47b349224ed7715dfa40c4ba)
    , (0xf89bfb98e9a677ecd5b7606474c9cbe28b6735c4)
    , (0x9b64fcfb07a270c652b2faa06ce7e88606ff7a07)
    , (0xe27baebd7b14602de3797974db9f5f4f8dcb6679) -- Etherscan
    , (0x24902aa0cf0000a08c0ea0b003b0c0bf600000e0) -- Etherscan
    , (0x16ccf917cf522010287a98b2896e25ab028114cb) -- Etherscan
    , (0x3aa228a80f50763045bdfc45012da124bd0a6809) -- Etherscan
    , (0x2684e2d55e30680186ca2d5f5393ac0fb808f011) -- Etherscan
    , (0x787ca0f0576a833ac6ad7a957ebc870c37ab8300) -- Etherscan
    , (0x1cdcec6630c99863fb1307c812691bc688f3e92e) -- Etherscan
    , (0x13f1c719c7114ac47d3f6ce8597a8c55ec7983da) -- Etherscan
    , (0x1ccdd6e0d68bd97abae46735182c7568c78857ff) -- Etherscan
    , (0xbb3520096b00071a25af2add99d1bc1391ae922b) -- Etherscan
    , (0x8dc6254dba998873072ccd424ed2059a14a61197) -- Etherscan
    , (0xa5c091f0db3d3206449cf517c81cf1080f3bcaba) -- Internal tx to Hiveon Pool
    , (0x2f7c1f1460aed2594a9977c58fa31c465591b287) -- Etherscan
    , (0x3face0004bc1003b9d0672e7b23134cb80115fb6) -- Etherscan
    , (0xf54ac0316e845502bf64c4b2eb754945c36a5f33) -- Etherscan
    , (0xdb46ac1b9b2cd2e4a452b991dc5417261e87b60c) -- Etherscan
    , (0xf88424cc0ffef9fd8456ca982cb5eaf872585a46) -- Etherscan
    , (0xbf901f52aef5bb098f6f7918e1fa0c639720f409) -- Etherscan
    , (0xe4000004000bd8006e00720000d27d1fa000d43e) -- Etherscan
    , (0x0ddc6f9ce13b985dfd730b8048014b342d1b54f7) -- Etherscan
    , (0x5ddf30555ee9545c8982626b7e3b6f70e5c2635f) -- Etherscan
    , (0x01bd2da640345f1c29831b7cef9a434298408172) -- Etherscan
    , (0x42183725df3be80bcefb3d12528417698c0c8a8c) -- Etherscan
    , (0xca980f000771f70b15647069e9e541ef73f71f2f) -- Etherscan
    ) AS x (address)
