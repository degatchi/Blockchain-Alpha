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

- You should use msg.sender for authorization (if another contract calls your contract msg.sender will be the address of the contract and not the address of the user who called the contract). It's also worth mentioning that by using tx.origin you're limiting interoperability between contracts because the contract that uses tx.origin cannot be used by another contract as a contract can't be the tx.origin. https://ethereum-contract-security-techniques-and-tips.readthedocs.io/en/latest/recommendations/#avoid-using-txorigin


~~ Alexander Schlindwein (Fei Protocol vulnerability finder):

What general advice would you give to aspiring blockchain bug bounty hunters?
A great way to get started learning about smart contract exploits is to practice by participating in wargames and CTFs. You can find some good ones in https://github.com/crytic/awesome-ethereum-security 's repository.

Also, do not get discouraged if you haven’t found a bug yet, even though you have spent a lot of time searching. Often you will be working with code that has been audited by world-class security experts and put through extensive testing. That does not mean that there are no bugs, though — an audit is no guarantee for security and the list of audited projects which have been exploited is long enough.

In fact, both ArmorFi and Fei Protocol were audited. This is the reason Immunefi exists in the first place. Yet, it is easy to get lost in the fallacy of feeling like you are wasting your time when you spend hours upon hours while apparently not achieving any result. In these moments, it is good to remember yourself that even in periods of low or no findings, the knowledge and insight you are gaining by studying and trying to exploit smart contracts will in the long run equip you with a skillset only very few people have, which in itself will be more than rewarding.


~~ Mudit:

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

What are the 3 first things you look at in Smart Contracts?
1) Architecture 
2) Access control
3) Fund transfers


~~ Leo Alt:

Do you have any advice for people who would like to go into this area of using formal verification on blockchain protocols and smart contracts? E.g. what are the pre-requisites? And if one is interested, what are the companies that we can apply for?
I think learning how to use the FV tools to their best, and a bit of how they work, will give you both practical experience in the topic + give you pointers to learn more about the theoretical aspects if you're interested. As far as companies go I can't really say specific names, but I guess companies that use FV for their audits.

As a very quick thought, accesses that public/external functions give, unsafe external calls and assembly.

Smart contract audits should not be used as stamps of approvals. Words like "Passed audit" are a big red flag. Audits are basically detailed code reviews. They do not guarantee security. It's very hard to quantify/standardize such a process. This is why there are so many shitty audit firms around. I don't expect reputable firms to take "personal loss" in case of accidents. That's a completely different product offering (Insurance). However, I do expect Insurance providers and Code auditors to work closely in the future.


~~ Christoph (ranked #1 hacker on Code4rena):

What CTFs/war games/materials do you recommend doing for someone aspiring to take your #1 spot on Code4rena?
I started out doing Damn Vulnerable Defi https://cmichel.io/damn-vulnerable-de-fi-solutions/, Ethernaut https://cmichel.io/ethernaut-solutions/ and Capture The Ether https://cmichel.io/capture-the-ether-solutions/. The links here include my solutions if you get stuck but try to do it on your own first. Another great way that got me in contact with other auditors and all major auditing firms was Paradigm CTF https://cmichel.io/paradigm-ctf-2021-solutions/

What tools do you use when auditing?
I don't use any tools that directly perform vulnerability analysis. I only use the great "Solidity Visual Developer" VSCode extension that highlights storage variables and function parameters which makes it easier to have some context when reading a new codebase.

How do you calculate the audit's cost?
Scoping audits is always a tough task and imo you only get better at it with experience. But I'll give you a rule of thumb: Let's say you can audit 200 lines of code per hour (which is a standard assumption among some auditors afaik) - adjust that parameter down if the code is complex, math-heavy or the documentation is bad. You then take the lines of code and divide it by 200 LOC/h, then you get the hours required to audit the code for a single person. If you're an independent auditor you should also add 5h-10h for compiling the report and all the biz-dev work, plus answering questions. Then you multiply it by your hourly rate. More on hourly rates below.

How much time do you spend on a contract on average till you "stop" looking at it, i.e. when new C4 projects launch?
How much do you use tools and how much is really looking at the code and manual work?
How do you make sure that your possible exploit really is possible when most C4 code is not deployed yet?
And: Do you have N/A too or do you report only 100% sure vulns?
1. That's a good question. I could always spend more time on the code and it would increase the likelihood of me finding bugs. But at some point, there's the point of "diminishing returns", where it's not reasonable to spend any more time on the code. Alexander Schlindwein was asked the same question regarding bug bounties but I think it applies to audits as well:
The approach which works best for me is to set myself the goal of fully understanding the system to the point where I could reimplement it from scratch without being allowed a look at the original codebase. Not from remembering the code, but from having understood what the application is supposed to do. If you have examined a project that far and have not found a bug, the chances of finding one by continuing is low. https://medium.com/immunefi/interview-with-legendary-bug-bounty-hunter-alexander-schlindwein-cced9c73c02a
Realistically, I often stop before reaching that point due to time constraints and opportunity costs when I think my limited time is better spent elsewhere.
2. 100% manual work for me
3. I definitely have N/As as well as I cannot code up a reproduction in a test framework for every issue I find. It would take too much time and I only do it for complex critical issues. Personally, I also think it's better to err on the side of "this looks like an issue to me, so I'll submit it" than "not sure if it's an issue, I keep it to myself". I've had devs tell me that even though my submission was wrong, they feel more confident in their code now because they reviewed the issue again. I'd like to stress though that I really appreciate it when a protocol has a great test setup that allows me to easily add a new test case without having to write huge amounts of setup code to get the protocol into the desired state first.

Can you describe/breakdown your auditing process?
1. Besides the technical skills like knowing many types of exploits, knowing the EVM well, or having seen issues of similar protocols, some personality traits that I think are useful: conscientiousness - I feel like some auditors don't even try to find all bugs and just want to be done with their job as quickly as possible. This happens especially if the incentives are not aligned and you get paid a fixed salary as is often the case with traditional auditing firms. So you want to hire people that are conscientious, who take their job seriously and take pride in their work.
2. You don't need cryptography knowledge to be an auditor but I see more and more math-heavy DeFi protocols, so being good at math is definitely a plus.
3. My income streams are 1) Code4rena 2) audits of protocols that reach out to me 3) investments 4) onlyfans
4. My auditing process is pretty straightforward. First I read the documentation. Then I read the code from top to bottom, I order the contracts in a way that makes sense: for example, I read the base class contract first before I read the derived class contract. I don't use any tools, but I heavily take notes and scribble all over the code. 😃 I'm using the "Solidity Visual Developer" extension which comes with the @audit, @audit-info, @audit-ok, @audit-issue markers which I all use to categorize my notes. After I read the entire codebase once I revisit my notes and resolve any loose ends or things I didn't understand earlier. Afterwards, I create my audit report out of these notes.

Any must-reads on auditing you recommend?
Subscribe to the "BlockThreat Newsletter" by https://twitter.com/_iphelix.
It's a weekly newsletter consisting of all security incidents, post mortems, and other security-related topics that happened in the past week. @Rajeev | Secureum list is great and compact https://secureum.substack.com/p/smart-contract-security-101-secureum 

Salary for auditors based on experience/skin level?
I'm not an expert on this but I'd say hourly rates for auditors are roughly:
- Junior: 100$/h
- Experienced: 100$-250$/h
- Top Auditors: 250$-1000$/h

----

# Solidity 
Error Handling:
- assert(bool condition): causes a Panic error and thus state change reversion if the condition is not met - to be used for internal errors.
- require(bool condition): reverts if the condition is not met - to be used for errors in inputs or external components.

<br /> 

When to use `memory`, `storage`, or `calldata`:
- Memory: When the var just has to be stored dudring a function execution.
- Calldata: When the var has to be passed around in function calls (i.e., value is passed to another function)
- Storage: When it has to be stored on-chain.

<br /> 

- Having multiple functions with the same naming convention with different params, i.e., `deposit(uint amount)`, `deposit(uint amount, address to)`, act as seperate functions.
----

# Persuasive Design
Techniques used to direct and capture your attention for an extended period of time, inevitably forming habits and creating a dopamine feedback loop to keep you coming back to use the 'product'.

https://line25.com/articles/persuasive-design-101

----

Resources
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
- https://medium.com/goldfinch-fi/solidity-learnings-how-to-save-50-on-gas-costs-5e598c364ab2 good overview of gas optimisations (MSTORE, MLOAD, SSTORE, SLOAD)

Security
- https://secureum.substack.com/p/ethereum-101
- https://github.com/leonardoalt/ethereum_formal_verification_overview
- https://github.com/crytic/awesome-ethereum-security

Podcasts
- https://www.youtube.com/watch?v=Pw6ch5c89Iw (Daniele Sesta on popscile finance and MIM, SPELL) 
