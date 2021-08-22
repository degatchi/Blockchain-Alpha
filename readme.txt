==== MEV ====
- Frontrun: Adversaries observing txs then paying high tx fees and optimizing network latency to anticipate and exploit - via placing their own orders before to ensure they are mined first - ordinary users' trades. 
- Priority Gas Auctions (PGAs): Bots competitvely bidding up transaction fees in order to obtain priorty ordering, i.e., early block position and execution, for their transactions.
- Pure revenue opportunities: A specific sub-category of DEX arbitrage representative of broader activity, these are blockchain transactions that issue multiple trades atomically through a smart contract and profit unconditionally in every traded asset.
- Miner-extractable value (MEV): We introduce the notion of MEV, value that is extractable by miners directly from smart contracts as cryptocurrency profits. One particular source of MEV is *ordering optimization (OO)* fees, which result from a miner’s control of the ordering of transactions in a particular epoch.
- Time-bandit attacks: We show that high-MEV regimes in general lead to a new attack in which miners rewrite blockchain history to steal funds allocated by smart contracts in the past.

==== MEV-Alpha ==== 
- Use Golang for high speed and optimisation - GETH is written in Golang.
- If you keep 1 wei of a token you are trading, you don't need to initialize the storage of a token. If you are trading on something for the first time, it costs a little bit extra gas than if you were to hold that 1 wei amount. Look at this bot's wallet `https://etherscan.io/address/0x000000000035b5e5ad9019092c665357240f594e#code`, you can see there are dozens of tokens with $0.00 value.
- Sandwiche attack a liquidity providing tx by adding a ton of liquidity before it (front-running) then withdrawing after the user puts their LP in. Why? To get the fees from user providing liquidity. This is effectively making a LP limit order - you need to have a broader perspective on the market + adjust your portfolio to achieve this.
- Why does extreme optimization matter, i.e. 50ms difference? 1) Speed matters a lot more in non-flashbots markets 2) faster simulation means we can search more broadly in the mempool and pick up things competitors don't & 3) to compete in PGAs

==== Frontrunning ====
- In order to frontrun, you need to run a node so you can access the mempool. Why? To see awaiting txs and replicate them with higher fees to be executed before them.

==== Security ====
Data from 16 case studies of 2020 DeFi exploits show that 1) 72.3% of hacks come from the Financial Model: e.g. interplay between bonding curve and constant product amm, Balancer hack 29/06/2020, 2) 27.4% from Insecure Implementations: e.g. re-entrancy & 3) 0.3% from Arbitrage. Why is this so? Insecure implementations have been well-studied by past works, so many existing auditing tools can catch them (i.e. slither). But *none* of the existing tools can check for financial model unsoundness!

Look for:
1) Before: Control Flow (e.g., if, return, require)
2) Before: Memory variables crerated AND used after
3) After: Storage rights

==== Resources ====
- https://arxiv.org/pdf/1904.05234.pdf
- https://tinyurl.com/yjaf45lo (mock mempool viewer)
