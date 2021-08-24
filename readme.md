# MEV
- Frontrun: Adversaries observing txs then paying high tx fees and optimizing network latency to anticipate and exploit - via placing their own orders before to ensure they are mined first - ordinary users' trades. 
- Priority Gas Auctions (PGAs): Bots competitvely bidding up transaction fees in order to obtain priorty ordering, i.e., early block position and execution, for their transactions.
- Pure revenue opportunities: A specific sub-category of DEX arbitrage representative of broader activity, these are blockchain transactions that issue multiple trades atomically through a smart contract and profit unconditionally in every traded asset.
- Miner-extractable value (MEV): We introduce the notion of MEV, value that is extractable by miners directly from smart contracts as cryptocurrency profits. One particular source of MEV is *ordering optimization (OO)* fees, which result from a miner’s control of the ordering of transactions in a particular epoch.
- Time-bandit attacks: We show that high-MEV regimes in general lead to a new attack in which miners rewrite blockchain history to steal funds allocated by smart contracts in the past.

## Alpha
- Use Golang for high speed and optimisation - GETH is written in Golang.
- If you keep 1 wei of a token you are trading, you don't need to initialize the storage of a token. If you are trading on something for the first time, it costs a little bit extra gas than if you were to hold that 1 wei amount. Look at this bot's wallet `https://etherscan.io/address/0x000000000035b5e5ad9019092c665357240f594e#code`, you can see there are dozens of tokens with $0.00 value.
- Sandwiche attack a liquidity providing tx by adding a ton of liquidity before it (front-running) then withdrawing after the user puts their LP in. Why? To get the fees from user providing liquidity. This is effectively making a LP limit order - you need to have a broader perspective on the market + adjust your portfolio to achieve this.
- Why does extreme optimization matter, i.e. 50ms difference? 1) Speed matters a lot more in non-flashbots markets 2) faster simulation means we can search more broadly in the mempool and pick up things competitors don't & 3) to compete in PGAs

### Frontrunning
- In order to frontrun, you need to run a node so you can access the mempool. Why? To see awaiting txs and replicate them with higher fees to be executed before them.

----

# Auditing
Data from 16 case studies of 2020 DeFi exploits show that 1) 72.3% of hacks come from the Financial Model: e.g. interplay between bonding curve and constant product amm, Balancer hack 29/06/2020, 2) 27.4% from Insecure Implementations: e.g. re-entrancy & 3) 0.3% from Arbitrage. Why is this so? Insecure implementations have been well-studied by past works, so many existing auditing tools can catch them (i.e. slither). But *none* of the existing tools can check for financial model unsoundness!

Look for:
1) Before: Control Flow (e.g., if, return, require)
2) Before: Memory variables crerated AND used after
3) After: Storage rights

## Auditing Approach
- While auditing, always keep an open communication channel with the developers to make sure you can ask questions if you are not sure about what they intend something is meant to do.
- Write test cases/fuzzing for the most critical functions.
- If the dev patches/fixes are small and you are able to verify the changes you can continue, otherwise if the changes are large and change a good portion of the codebase, the current audit is essentially void and a new auditor should be used since reviewing a new codebase in such a small period of time wont be effective.
- If the math is too complicated, beyond comprehension, tell the devs and recommend they find someone else suitable.
- Informational adds: gas optimisation, linting, unnecessary code.


1) Read about the project to get an idea of what the smart contracts are meant to do. Glance over all the resources about the project that were made available to you.
2) Glance over the smart contracts to get an idea of the smart contracts architecture. Tools like Surya can come in handy.
3) Create a threat model and make a list of theoretical attack vectors (thinking, "how would an attack try to exploit this contract?") including all common pitfalls (i.e., before Solidity 0.8.0, overflows and underflows weren't reverted and `SafeMath.sol` was required) and past exploit techniques (re-entrancy, flashloans, pool balance manipulation, etc).
4) Look at places that can do value exchange, also checking if there are missing role requirements, allowing you to review the most critical functionality within a few hours. Especially functions like transfer, transferFrom, send, call, delegatecall, and selfdestruct. Walk backward from them to ensure they are secured properly (useful when viewing large codebases that have thousands of lines to review). Brain-storm new attacks for each smart contract - usually a day for each contract - creating proof-of-concept attacks (i.e., change a param to a certain something, going a different direction with the function flow, etc)
5) Do a line-by-line review of the contracts. Looking for logic bugs (where the contract is not behaving in a way it is supposed to, i.e., the whitepaper and smart contract don't align) and making sure the contract is safe from the exploits listed earlier. 
6) Do another review from the perspective of every actor in your threat model (i.e., liquidity provider, user swapping), calling the functions in various ways (the most common use cases and only after with uncommon use cases/combinations).
7) Run tools like Slither and review their output.
8) Glance over the test cases and code coverage.

After telling the devs about the review, do another round of review, however not as comprehensive.

----

# Solidity 
- Having multiple functions with the same naming convention with different params, i.e., `deposit(uint amount)`, `deposit(uint amount, address to)`, act as seperate functions.

----

# Resources
- https://arxiv.org/pdf/1904.05234.pdf
- https://tinyurl.com/yjaf45lo (mock mempool viewer)
- https://consensys.github.io/smart-contract-best-practices/known_attacks/
- https://www.certik.org/ (read existing audit reports)
- https://github.com/ethereumbook/ether...
- https://cryptozombies.io/
- https://solidity-by-example.org/
- https://docs.soliditylang.org/
- https://ethereum.org/en/learn/
- https://ethernaut.openzeppelin.com/
