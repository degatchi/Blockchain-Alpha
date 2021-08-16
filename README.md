# MEV
*Frontrun*: Paying high tx fees and optimizing network latency to anticipate and exploit, ordinary users' trades.
*Priority Gas Auctions (PGAs)*: bots competitvely bidding up transaction fees in order to obtain priorty ordering, i.e., early block position and execution, for their transactions.

### MEV-Alpha
- If you keep 1 wei of a token you are trading, you don't need to initialize the storage of a token. If you are trading on something for the first time, it costs a little bit extra gas than if you were to hold that 1 wei amount.
- Sandwiche attack a liquidity providing tx by adding a ton of liquidity before it (front-running) then withdrawing after the user puts their LP in. Why? To get the fees from user providing liquidity. This is effectively making a LP limit order - you need to have a broader perspective on the market + adjust your portfolio to achieve this.
- Why does extreme optimization matter, i.e. 50ms difference? 1) Speed matters a lot more in non-flashbots markets 2) faster simulation means we can search more broadly in the mempool and pick up things competitors don't & 3) to compete in PGAs

# Security
Data from 16 case studies of 2020 DeFi exploits show that 1) 72.3% of hacks come from the Financial Model: e.g. interplay between bonding curve and constant product amm, Balancer hack 29/06/2020, 2) 27.4% from Insecure Implementations: e.g. re-entrancy & 3) 0.3% from Arbitrage. Why is this so? Insecure implementations have been well-studied by past works, so many existing auditing tools can catch them (i.e. slither). But *none* of the existing tools can check for financial model unsoundness!
