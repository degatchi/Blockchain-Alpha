# MEV

---

## Glosssary
- Frontrun: Adversaries observing txs then paying high tx fees and optimizing network latency to anticipate and exploit - via placing their own orders before to ensure they are mined first - ordinary users' trades.
- Priority Gas Auctions (PGAs): Bots competitively bidding up transaction fees in order to obtain priority ordering, i.e., early block position and execution, for their transactions.
- Pure revenue opportunities: A specific sub-category of DEX arbitrage representative of broader activity, these are blockchain transactions that issue multiple trades atomically through a smart contract and profit unconditionally in every traded asset.
- Miner-extractable value (MEV): We introduce the notion of MEV, value that is extractable by miners directly from smart contracts as cryptocurrency profits. One particular source of MEV is _ordering optimization (OO)_ fees, which result from a miner’s control of the ordering of transactions in a particular epoch.
- Time-bandit attacks: We show that high-MEV regimes in general lead to a new attack in which miners rewrite blockchain history to steal funds allocated by smart contracts in the past.

---

## Lessons Learned
- An extremely high failure rate is common (around 90%+). You need to account for that in your profit targets. E.g., if it costs 10c for fail, and 50c for success, and you run a 90% fail rate, then you should be able to determine what your min profit per trade should be using those - or change your strategy entirely. Flashloan fee will instantly kill most trades, because someone looking at it who doesn't need to flashloan will probably be able to take it for a profit while you come out with a loss, so they automatically have more opportunities to look at. For ideas, look at those who are beating you. So, you found an opportunity and lost it - who beat you, and what did they do - and better yet, what else are they looking at? (look at the flashbots block explorer).
- flashswap / flashloans are a hot word in defi, bear in mind that many of them are pure scams, so make sure you interact with a reputable smart contract.
i mean that some people are launching flashloans services that are just honeypots (smart contract that eats your mone and don't give you anything back), not that the concept of flashloans is a scam.
- Let's say, after months and month of learning I find some alpha, maybe on a L2 or something, another chain, or something unique. How long does that alpha last? I've seen numbers like 1 month? On non-flashbot chains, its more about execution, so you might be able to sit on the same script for literally months and it will chug along fine, until someone else out-executes you and then you need to up your game. I've run some crappy script on some random chain for about 3 months with close to no changes just fine. But on a very high volume chain (bsc) ive had to switch it up nearly weekly. Its not like you automatically get sniped, someone has to somehow find you on the explorer and figure out what youre doing. Then they have to implement it, etc. There are way too many protocols I think there is a lot of undiscovered MEV. Theres new protocols every week across all chains so you should be able to figure out something. E.g., last week i found this really sweet stableswap that was literally 0% fees, but only allowed in one direction and under certain conditions.
- Bundles are visible in the explorer, so private mempool wont help hide anything
alpha can be copied, but execution is nearly always more important unless your name is ethermine. Bidding war on eth is a real issue, and is why people like to work on side chains that relies more on execution instead. Personally id say that seeking out new alpha is always worth it if youre an established searcher and know what youre looking out for but a newer one breaking into the space may find it hard to do. Making a living is very doable even with a shit bot imho, but that also depends on your definition of what a living wage is - lets say $500 a day - thats on the low end of the average searcher's daily profits imo. The initial learning curve to making your first successful profitable bundle is quite steep, and everyone takes a different approach and takes their own time to get it done, but feels so good when it hits.
- Is anyone at the hobbylist level making any money doing arb / flashbot or is all the alpha eaten up by bigger players? Yes, it's extremely profitable. Just don't do the incredibly obvious ones that literally everyone can do and you might be okay. If you put the effort you need to put into arbs into basically anything else you'll make far more money than you would with arbs will take a couple months before you make any money (if %s haven't even further increased by then), and if you're at the point where you can write an efficient yul contract + an arb backend that makes money.
- The code inside bots are pretty simple most of the time. It's everything else that is hard. It's not worth to doing gas optimization, it's more important to focus on the offchain logics.
I kinda agree that I was monitoring a bot, the contract level is not gas efficient at all. but he got lots of opportunities still. If you're trying to optimize gas to be competitive you're already too late to that opportunity imo. (If what you're going after is profit). If I were to get into the space now though, I don't think I'd be looking at competing for atomic arb/sandwiches. I probably would look at learning how to do them, then figure out a different direction with that knowledge.
- You'll make more money finding protocol specific MEV. Find random protocols that require you to do stuff.
- What you need to do in your arbitrage bots: 1) You should be able to run the SimpleArb.sol  repo first on the goerli network, then on the Mainnet and search for arb (no need to find a process first). 2) Try to constantly improve this Simple arbitrage bot (For example: use your own node instead of infura + use WS instead of PC).
- If I've gone thru the effort of writing code, even if its not original why would I want others to be able to use it. Making them write it themselves puts them back N days, which is N more days I can run + generate profits before an additional competitor arrives.
- I'd say if you're willing to put in the time to learn making $100 is feasible. Just don't expect it to happen instantly. I went into this thinking it was a cool get rich quick scheme and it took me a couple months of working and learning every day until I started making some money. That's where I started. Eventually I came to the conclusion that arbitrage is too competitive to use flashloans and I was better of funding my contract even with a small amount. But that shouldn't stop you from trying, who knows maybe you can find a way. One factor in success is writing an efficient smart contract, and flashloans aren't very efficient.
- A GETH node is 500gbs. Should get 1tb SSD though.
- The best searchers do as much as they can offchain in order to have a low gas limit so they can boost their gas cost to be more competitive in PGAs.
- When finding a MEV opportunity: 1) understand the contract: make note of the functions you need to call in order to execute the logic. 2) build monitoring capabilities: try and do as much as you can offchain. 3) plan execution in testing environment: make sure it works. 4) start optimising.
- It's good to write a lot of fail-safes b/c if you don't, it will fail. The more fail-safes, the better your script will be.
- UniswapV2 `path[]`: Any swap needs to have a starting and end path. While in Uniswap v2 you can have direct token to token pairs, it is not always guaranteed that such a pair actually exists. But you may still be able to trade them as long as you can find a path, e.g., Token1 → Token2 → WETH → Token3. In that case you can still trade Token1 for Token3, it will only cost a little bit more than a direct swap.
- Generate bytecode data payloads + target methods of function call w/ certain params. This saves a ton on storage reads + allows for contract upgrades to add new dex addresses. (Done w/ `address.call(payload)`)

## Links
### Articles
- (Monitor + snipe liquidity pairs)[https://cryptomarketpool.com/how-to-create-a-snipe-bot-to-monitor-liquidity-pairs-in-python/]
- (Salmonella)[https://github.com/Defi-Cartel/salmonella]
- (Coinbase Salmonella)[https://twitter.com/bertcmiller/status/1381296074086830091]
- (Cross-chain Arb Monitor)[https://github.com/makoto/xdai-arb-graph]
- (MevAlphaLeak's ApeBank)[https://etherscan.io/address/0x00000000454a11ca3a574738c0aab442b62d5d45#code]
- (Finding & Capturing MEV 101)[https://www.youtube.com/watch?v=70WtsHtFd8Y]
- (Research articles)[https://github.com/flashbots/mev-research/blob/main/resources.md]
- (Graphs algorithms and currency arbitrage)[https://reasonabledeviations.com/2019/03/02/currency-arbitrage-graphs/]
- (Episode 216: A Dip into the Mempool & MEV with Project Blanc)[https://www.youtube.com/watch?v=gi6MU6Xcmok]
- (Pancakeswap Bot)[https://github.com/Nafidinara/bot-pancakeswap]
- (Liquidity deployment in strategy)[https://twitter.com/mevintern/status/1409510748867399684]
- (An analysis of Uniswap markets)[https://web.stanford.edu/~guillean/papers/uniswap_analysis.pdf]

### Bot examples
- (liquidiation-bot-fall-2020)[https://github.com/fxfactorial/liquidation-bot-fall-2020]
- (Supercycled's cake_sniper twitter thread)[https://twitter.com/_supercycled/status/1414538498477072390]

---

## GETH
***What is GETH? <br />***
GETH **IS** Ethereum. it's the software that miners run. you can also run it without mining and just use it to access data, mempool, etc, via a litenode (maybe named something different, many chains call it a "RPC node" or "API node"). Although you can submit transactions to it, your node just isn't the one that confirms them to the blockchain it will pass them off to the network until a miner mines it. For example, FlashBots, a service that relays your bundles (sorts them via miner fee and no-errors) to the miners, is just a modified geth node that had 300 lines of code added. 

***Why is GETH important and why should you learn it? <br />***
Well, in order to become competitive you need to know what everyone is doing and when someone interacts with a smart-contract state mutable function it doesn't emit an event if there is no event called in the function. So, the way someone could monitor whether a function is being called by searching the mempool (pool of unconfirmed transactions) for pending transactions with a specific hash and then doing something with that information, e.g, copying the tx's params and frontrunning them w/ higher gas. TD:LR; you need it to setup custom subscription events to track conditional events that can help with your bot monitoring system.

### Articles
- (Tips for understanding GETH)[https://twitter.com/0xGreg_/status/1408773433371107330]
- (Pending transactions, ABI decoding uniswap in golang)[https://hyegar.com/posts/pending-tx-and-abi/]
- (Adding a new event to geth)[https://hyegar.com/posts/new-event-to-geth/]
- (Signed flashbots requests in golang)[https://hyegar.com/posts/flashbots-rpc/]

---
