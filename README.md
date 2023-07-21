- 获取测试代币 [faucet](https://www.freefaucet.tech/)

- 部署WETH
  - 编译设置
    - 新建文件 WETH.sol，将 [WETH合约源码](https://cn.etherscan.com/address/0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2#code) 复制过来。
    - 使用默认环境编译
  - 部署设置
    - CONTRACT 选择 WETH9，ENVIRONMENT 选择 Injected Web3
    - 连接 MetaMask 的 Goerli 网络进行部署。

- 部署Factory
  - 编译设置
    - 新建文件 UniswapV2Factory.sol，将 [Factor合约源码](https://cn.etherscan.com/address/0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f#code) 复制过来。
    - 使用默认环境编译
  - 部署设置
    - 随便设置一个 _feeToSetter 地址之后，CONTRACT 选择UniswapV2Factory，ENVIRONMENT 选择 Injected Web3
    - 连接 MetaMask 的 Goerli 网络进行部署。

- 部署Router
  - 编译设置
    - 新建文件 UniswapV2Router02.sol，将 [Router合约源码](https://cn.etherscan.com/address/0x7a250d5630b4cf539739df2c5dacb4c659f2488d#code) 复制过来。
    - 在chainide中获取 UniswapV2Factory.sol 中 CONTRACT 为 UniswapV2Pair 时 Bytecode 的object对象，粘贴到 [keccak_256](http://emn178.github.io/online-tools/keccak_256.html) 后获取hash值(注意要用hex模式)，替换 UniswapV2Router02.sol 中的 initCode 码（之所这么做是因为Router需要通过这个hash找到Pair的地址，而hash会随着编译环境的改变而变化，真他妈是个鬼才！）
    - 允许 Enable optimization（不然会因为bytecode 过长部署失败）进行编译。
  - 部署设置
    - 填入上面的 Factory 和 WETH 地址之后，CONTRACT 选择 UniswapV2Router02，ENVIRONMENT 选择 Injected Web3
    - 连接 MetaMask 的 Goerli 网络进行部署。
