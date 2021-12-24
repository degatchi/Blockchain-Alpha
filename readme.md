# Blurb
A collection of valuable info for the curious minds of blockchain development

---

# Getting into blockchain development
1. First, learn the fundamentals of Javascript (watch a video on yt and just experiment). This is vital to understand as Solidity, smart-contract testing, web3 frontend, bot creating and other languages will be using the core concepts and syntax of JS.
2. Once you've got a solid understanding of JS's core concepts, jump into https://cryptozombies.io/ + https://solidity-by-example.org/. These will teach you the fundamentals of Solidity development, allowing you to write EVM compatible contracts and grasp a good idea of how contracts are written.
3. Start watching tutorials on youtube (https://www.youtube.com/watch?v=Ztr2Jet2-YY - i need to make more tbh) and play around with smart contract creation in remix. Remix is an in-browser code editor that allows easy access to deployment, function calls + error recognition. 
4. Make sure to get your github account, github desktop + vscode. This will be your main source of code storage + where your portfolio will grow.
5. Start creating contracts in vscode w/ hardhat (truffle is outdated vs hardhat) and start doing CTFs (damn vulnerable defi, ethernaut, etc).
6. Come up with an idea and start building! Maybe go for some basic ideas first, i.e., user deposits ether, ether is split between x amount of users. Don't forget to add ethers, solidity +/or web3.js tests!
7. Read compound comptroller, aave flashloans, uniswap-v2, sushiswap masterchef + pancakeswap masterchef contracts as they are staples + common contracts that are used.
8. Explore the space! Research and enjoy your time :D

---

# Founding/Start-up
- A record of advice and things i've learned while cofounding, working for other protocols + developing protocols.
### Notes
- Build + ship quick. Have a working product w/ a basic UI and work from there.
- Don't burn out. Take breaks + don't work 24/7 bc taking a step back will allow you to take 3 more steps forward and be able to do this more consistently.
- Community > Product. Make sure products are being shipped, etc. However, without a community, the product is non-existent. It's much harder to bring back community members then it is to get them.
- Be transparent. If you need more time to ship, announce that. Investors do not want to be left in the dark. Not being transparent will deter investors.
- UNDERPROMISE + OVERDELIVER. Overpromising + overdelivering doesn't big as much as much excitement as underpromising + overpromising. 
- Think about what you're promising before you do it and make sure you follow through. Never back yourself into a corner.
- Know what you're talking about to gain confidence of investors
- Don't bite off more than you can chew (i.e, roadmap)
- Instead of making a roadmap, have a dev board of what is underdevelopment with no deadline. Deadlines cause stress and if not delivered (very possible due to unexpected errors, irl stuff, etc) investors will lose faith.
- Think of opportunity cost: should you do a frontend for a completed contract or build out a new contract to capture a new wave of opportunity (i.e, NFT craze). Be flexible + let your holders know you have a plan. If you get your holder's trust, you are able to do more things. Get trust by delivering + keeping your word.

### Expansion
- Make a payroll system
- Get a team of people better than you
- Modularize! There is only so much you can do with your time.
- Have a fund pool to pay for audits, marketing, listings, contractors, partnerships, etc.
- Give real use-case-tests to people you interview to test what they are capable of.

### Protocol Development
- THE BIGGEST KILLER OF PROTOCOL ARCHITECTS IS ALWAYS WORKING ON THE 'BABY' BUT NEVER 'GIVING BIRTH'. In order to actually progress, you must make and deploy different versions (i.e, 1, 2, 3, ...). 
- Think of an idea from scratch or improve someone else's idea/product.
- Innovate, ship, research, repeat. Do this as fast as possible. There is an abundance of capital in the cryptosphere. You need to take advantage of these opportunities! Release a V-0, then V-1, then V-2 - each having considerable improvements.

### UI/UX Development
- Have a tutorial/popup toggle that when hovering over buttons it explains what’s happening and the cause and effects. Have a walkthrough button that when clicked explains how the product works and how to use it. This helps onboarding new users, especially for non-crypto natives. 
- Increase accessibility: the easier the platform is to use, the more people will be onboarded.
- Innovate + educate: without educating, the innovation wont reach it's full potential! Guide those new to the platform.

### Networking
- Don't be afraid to message anyone. You never know the opportunities that await until you approach others.
- Join twitter spaces + chat! You'll learn so much and meet so many people that will make life better <3
- Developing/being active in a community is what brings attention to yourself and your product, don't dismiss it!

### Marketing
90% of marketing problems startups face are:
1. Distribution (growing channels & exposure)
2. Driving conversions (sales, clicks, subscribes)
3. Developing a brand (consistent & reputable)

---

# NFTs
 

## Resources
https://metaversal.banklesshq.com/p/intro-to-nft-collection-launches

---

# MEV
- Frontrun: Adversaries observing txs then paying high tx fees and optimizing network latency to anticipate and exploit - via placing their own orders before to ensure they are mined first - ordinary users' trades.
- Priority Gas Auctions (PGAs): Bots competitively bidding up transaction fees in order to obtain priority ordering, i.e., early block position and execution, for their transactions.
- Pure revenue opportunities: A specific sub-category of DEX arbitrage representative of broader activity, these are blockchain transactions that issue multiple trades atomically through a smart contract and profit unconditionally in every traded asset.
- Miner-extractable value (MEV): We introduce the notion of MEV, value that is extractable by miners directly from smart contracts as cryptocurrency profits. One particular source of MEV is _ordering optimization (OO)_ fees, which result from a miner’s control of the ordering of transactions in a particular epoch.
- Time-bandit attacks: We show that high-MEV regimes in general lead to a new attack in which miners rewrite blockchain history to steal funds allocated by smart contracts in the past.

## Alpha

- Use Golang for high speed and optimization - GETH is written in Golang.
- If you keep 1 wei of a token you are trading, you don't need to initialize the storage of a token. If you are trading on something for the first time, it costs a little bit extra gas than if you were to hold that 1 wei amount. Look at this bot's wallet `https://etherscan.io/address/0x000000000035b5e5ad9019092c665357240f594e#code`, you can see there are dozens of tokens with $0.00 value.
- Sandwich attack a liquidity providing tx by adding a ton of liquidity before it (front-running) then withdrawing after the user puts their LP in. Why? To get the fees from user providing liquidity. This is effectively making a LP limit order - you need to have a broader perspective on the market + adjust your portfolio to achieve this.
- Why does extreme optimization matter, i.e. 50ms difference? 1) Speed matters a lot more in non-flashbots markets 2) faster simulation means we can search more broadly in the mempool and pick up things competitors don't & 3) to compete in PGAs

## Frontrunning

- In order to frontrun, you need to run a node so you can access the mempool. Why? To see awaiting txs and replicate them with higher fees to be executed before them.

---

# Auditing

### Notes

- You should use msg.sender for authorization (if another contract calls your contract msg.sender will be the address of the contract and not the address of the user who called the contract). It's also worth mentioning that by using tx.origin you're limiting interoperability between contracts because the contract that uses tx.origin cannot be used by another contract as a contract can't be the tx.origin. https://ethereum-contract-security-techniques-and-tips.readthedocs.io/en/latest/recommendations/#avoid-using-txorigin

<br />

## Q+A

### Alexander Schlindwein: Fei Protocol vulnerability finder

Q) What general advice would you give to aspiring blockchain bug bounty hunters?
<br /> A) A great way to get started learning about smart contract exploits is to practice by participating in wargames and CTFs. You can find some good ones in https://github.com/crytic/awesome-ethereum-security 's repository.

Also, do not get discouraged if you haven’t found a bug yet, even though you have spent a lot of time searching. Often you will be working with code that has been audited by world-class security experts and put through extensive testing. That does not mean that there are no bugs, though — an audit is no guarantee for security and the list of audited projects which have been exploited is long enough.

In fact, both ArmorFi and Fei Protocol were audited. This is the reason Immunefi exists in the first place. Yet, it is easy to get lost in the fallacy of feeling like you are wasting your time when you spend hours upon hours while apparently not achieving any result. In these moments, it is good to remember yourself that even in periods of low or no findings, the knowledge and insight you are gaining by studying and trying to exploit smart contracts will in the long run equip you with a skillset only very few people have, which in itself will be more than rewarding.

<br />

### Mudit: Security Researcher and Developer, helping SushiSwap build their next gen AMM - Trident

Data from 16 case studies of 2020 DeFi exploits show that 1) 72.3% of hacks come from the Financial Model: e.g. interplay between bonding curve and constant product amm, Balancer hack 29/06/2020, 2) 27.4% from Insecure Implementations: e.g. re-entrancy & 3) 0.3% from Arbitrage. Why is this so? Insecure implementations have been well-studied by past works, so many existing auditing tools can catch them (i.e. slither). But _none_ of the existing tools can check for financial model unsoundness!

Look for:

1. Before: Control Flow (e.g., if, return, require)
2. Before: Memory variables created AND used after
3. After: Storage rights

Auditing Approach

- While auditing, always keep an open communication channel with the developers to make sure you can ask questions if you are not sure about what they intend something is meant to do.
- Write test cases/fuzzing for the most critical functions.
- If the dev patches/fixes are small and you are able to verify the changes you can continue, otherwise if the changes are large and change a good portion of the codebase, the current audit is essentially void and a new auditor should be used since reviewing a new codebase in such a small period of time wont be effective.
- If the math is too complicated, beyond comprehension, tell the devs and recommend they find someone else suitable.
- Informational adds: gas optimization, linting, unnecessary code.

1. Read about the project to get an idea of what the smart contracts are meant to do. Glance over all the resources about the project that were made available to you.
2. Glance over the smart contracts to get an idea of the smart contracts architecture. Tools like Surya can come in handy.
3. Create a threat model and make a list of theoretical attack vectors (thinking, "how would an attack try to exploit this contract?") including all common pitfalls (i.e., before Solidity 0.8.0, overflows and underflows weren't reverted and `SafeMath.sol` was required) and past exploit techniques (re-entrancy, flashloans, pool balance manipulation, etc).
4. Look at places that can do value exchange, also checking if there are missing role requirements, allowing you to review the most critical functionality within a few hours. Especially functions like transfer, transferFrom, send, call, delegatecall, and selfdestruct. Walk backward from them to ensure they are secured properly (useful when viewing large codebases that have thousands of lines to review). Brain-storm new attacks for each smart contract - usually a day for each contract - creating proof-of-concept attacks (i.e., change a param to a certain something, going a different direction with the function flow, etc)
5. Do a line-by-line review of the contracts. Looking for logic bugs (where the contract is not behaving in a way it is supposed to, i.e., the whitepaper and smart contract don't align) and making sure the contract is safe from the exploits listed earlier.
6. Do another review from the perspective of every actor in your threat model (i.e., liquidity provider, user swapping), calling the functions in various ways (the most common use cases and only after with uncommon use cases/combinations).
7. Run tools like Slither and review their output.
8. Glance over the test cases and code coverage.

After telling the devs about the review, do another round of review, however not as comprehensive.

What are the 3 first things you look at in Smart Contracts?

1. Architecture
2. Access control
3. Fund transfers

<br />

### Leo Alt: Researcher and Formal Verification Lead at the Ethereum Foundation

Q) Do you have any advice for people who would like to go into this area of using formal verification on blockchain protocols and smart contracts? E.g. what are the pre-requisites? And if one is interested, what are the companies that we can apply for?
<br />A) I think learning how to use the FV tools to their best, and a bit of how they work, will give you both practical experience in the topic + give you pointers to learn more about the theoretical aspects if you're interested. As far as companies go I can't really say specific names, but I guess companies that use FV for their audits.

As a very quick thought, accesses that public/external functions give, unsafe external calls and assembly.

Smart contract audits should not be used as stamps of approvals. Words like "Passed audit" are a big red flag. Audits are basically detailed code reviews. They do not guarantee security. It's very hard to quantify/standardize such a process. This is why there are so many shitty audit firms around. I don't expect reputable firms to take "personal loss" in case of accidents. That's a completely different product offering (Insurance). However, I do expect Insurance providers and Code auditors to work closely in the future.

<br />

### Christoph: Ranked #1 hacker on Code4rena

Q) What CTFs/war games/materials do you recommend doing for someone aspiring to take your #1 spot on Code4rena?
<br />A) I started out doing Damn Vulnerable Defi https://cmichel.io/damn-vulnerable-de-fi-solutions/, Ethernaut https://cmichel.io/ethernaut-solutions/ and Capture The Ether https://cmichel.io/capture-the-ether-solutions/. The links here include my solutions if you get stuck but try to do it on your own first. Another great way that got me in contact with other auditors and all major auditing firms was Paradigm CTF https://cmichel.io/paradigm-ctf-2021-solutions/

Q) What tools do you use when auditing?
<br />A) I don't use any tools that directly perform vulnerability analysis. I only use the great "Solidity Visual Developer" VSCode extension that highlights storage variables and function parameters which makes it easier to have some context when reading a new codebase.

Q) How do you calculate the audit's cost?
<br />A) Scoping audits is always a tough task and imo you only get better at it with experience. But I'll give you a rule of thumb: Let's say you can audit 200 lines of code per hour (which is a standard assumption among some auditors afaik) - adjust that parameter down if the code is complex, math-heavy or the documentation is bad. You then take the lines of code and divide it by 200 LOC/h, then you get the hours required to audit the code for a single person. If you're an independent auditor you should also add 5h-10h for compiling the report and all the biz-dev work, plus answering questions. Then you multiply it by your hourly rate. More on hourly rates below.

How much time do you spend on a contract on average till you "stop" looking at it, i.e. when new C4 projects launch? <br />
How much do you use tools and how much is really looking at the code and manual work? <br />
How do you make sure that your possible exploit really is possible when most C4 code is not deployed yet? <br />
And: Do you have N/A too or do you report only 100% sure vulns? <br />

1. That's a good question. I could always spend more time on the code and it would increase the likelihood of me finding bugs. But at some point, there's the point of "diminishing returns", where it's not reasonable to spend any more time on the code. Alexander Schlindwein was asked the same question regarding bug bounties but I think it applies to audits as well:
   The approach which works best for me is to set myself the goal of fully understanding the system to the point where I could reimplement it from scratch without being allowed a look at the original codebase. Not from remembering the code, but from having understood what the application is supposed to do. If you have examined a project that far and have not found a bug, the chances of finding one by continuing is low. https://medium.com/immunefi/interview-with-legendary-bug-bounty-hunter-alexander-schlindwein-cced9c73c02a
   Realistically, I often stop before reaching that point due to time constraints and opportunity costs when I think my limited time is better spent elsewhere.
2. 100% manual work for me
3. I definitely have N/As as well as I cannot code up a reproduction in a test framework for every issue I find. It would take too much time and I only do it for complex critical issues. Personally, I also think it's better to err on the side of "this looks like an issue to me, so I'll submit it" than "not sure if it's an issue, I keep it to myself". I've had devs tell me that even though my submission was wrong, they feel more confident in their code now because they reviewed the issue again. I'd like to stress though that I really appreciate it when a protocol has a great test setup that allows me to easily add a new test case without having to write huge amounts of setup code to get the protocol into the desired state first.

Q) Can you describe/breakdown your auditing process?

1. Besides the technical skills like knowing many types of exploits, knowing the EVM well, or having seen issues of similar protocols, some personality traits that I think are useful: conscientiousness - I feel like some auditors don't even try to find all bugs and just want to be done with their job as quickly as possible. This happens especially if the incentives are not aligned and you get paid a fixed salary as is often the case with traditional auditing firms. So you want to hire people that are conscientious, who take their job seriously and take pride in their work.
2. You don't need cryptography knowledge to be an auditor but I see more and more math-heavy DeFi protocols, so being good at math is definitely a plus.
3. My income streams are 1) Code4rena 2) audits of protocols that reach out to me 3) investments 4) onlyfans
4. My auditing process is pretty straightforward. First I read the documentation. Then I read the code from top to bottom, I order the contracts in a way that makes sense: for example, I read the base class contract first before I read the derived class contract. I don't use any tools, but I heavily take notes and scribble all over the code. 😃 I'm using the "Solidity Visual Developer" extension which comes with the @audit, @audit-info, @audit-ok, @audit-issue markers which I all use to categorize my notes. After I read the entire codebase once I revisit my notes and resolve any loose ends or things I didn't understand earlier. Afterwards, I create my audit report out of these notes.

Q) Any must-reads on auditing you recommend? <br />
A) Subscribe to the "BlockThreat Newsletter" by https://twitter.com/_iphelix.
It's a weekly newsletter consisting of all security incidents, post mortems, and other security-related topics that happened in the past week. @Rajeev | Secureum list is great and compact https://secureum.substack.com/p/smart-contract-security-101-secureum

Q) Salary for auditors based on experience/skin level? <br />
A) I'm not an expert on this but I'd say hourly rates for auditors are roughly:

- Junior: 100$/h
- Experienced: 100$-250$/h
- Top Auditors: 250$-1000$/h

<br />

### Samczsun: Research Partner at Paradigm, focused on supporting portfolio companies and researching security and related topics, prev ToB

If you're asking for what I think the three most common vulnerabilities are, I would say

- missing input validation (not checking if a token is legit, etc)
- improper access control (function should be private but is public, should be onlyOwner but isn't, etc)
- bad math

However, just know that the key to success isn't to memorize a checklist of vulnerabilities and go through them one by one, it's being able to react to what you see and pattern match based on your experiences. A checklist wouldn't have found the Poly Network exploit, but a careful reading and analysis successfully prevented a similar bug in Optimism from going live (https://github.com/ethereum-optimism/contracts/pull/360)

My policy is that everything stays private by default unless I have some reason to make it public. I don't have a good reason to de-anonymize myself right now so I don't.

Q) What activities were the most productive for you to gain a deep understanding of lower-level ethereum concepts? <br />
A) Always be curious and don't be afraid to dig deep into concepts. Have you ever wondered how a mapping is implemented, and why do we assume collisions are impossible? What's the difference between calling a regular function and a view function, and how does the EVM enforce that? There's plenty of questions that are waiting to be asked about Solidity and Ethereum that most people just take for granted, and the answers to those questions will require you to explore the EVM. There's no better way to learn about low-level concepts than this imo

Q) How much code do you write on a weekly basis vs read? <br />
A) I split about 50/50 right now because I'm working on some tooling, but sometimes I might go weeks without writing any code at all

Q) How did you get to where you are now? <br />
A) I started with smart contract security by reading blogs about common vulnerabilities just to get myself up to speed, and then slowly worked my way down the stack as I felt more and more comfortable about what I knew. Jumping right into the EVM seems like a great way to burn yourself out if you're not prepared for it

Q) What is your tooling like? <br />
A) My tooling is very simple.

Browsing source code:

- GitHub web, for smaller projects (basically most projects, I did my review of Uniswap v3 on GitHub)
- VSCode, for bigger projects (0x v4)

Exploit development:

- Remix
- A custom remix plugin to let me write quick scripts (impersonate accounts, print debug messages, etc). You can do the same with Hardhat/hevm, I'm just too used to my workflow now

Finding random things on-chain

- etherscan.io
- ethtx.info
- ethervm.io
- seth

Q) What qualities make a good auditor/security engineer? <br />
A) My default answer is being able to look at something and question how it really works, but actually now that I think about it, I want to run a few experiments to try and test that hypothesis. Maybe more to come 😄

Q) How would you describe your auditing process? <br />
A) If it's a small enough codebase, I skim and audit at the same time, getting a sense for how the code works while looking for common issues. If the codebase is too big, then I need to really focus on understanding the logic before I can move on to looking for bugs. The auditing process itself is really just approaching the code at a bunch of different angles and trying to tease out what's being assumed and how I might break it. Different angles help me narrow down the scope so I know which functions I care about and which ones I don't

Q) Any recommended must-read resources on security/auditing? <br />
A) Nothing in particular, I wouldn't attribute my knowledge to any one (or n < 3) blog post or the like. My number one recommendation is always to just go out there and do the thing, whether it's on live contracts (Immunefi) or CTFs (there's this really neat one called Paradigm CTF 😉)

Q) Is there a better model than requiring auditors (where the cards are so heavily stacked against them)? rugdoc seems to cover lots of contracts at a fast time <br />
A) imo auditors should be extremely vocal about the fact that audits aren't guarantees of security but simply third-party code reviews, and they should make sure that their clients don't treat it as such. Right now things are so bad that a handful of auditors are singlehandedly killing the reputation of the space as a whole because they keep producing reports which they themselves present as guarantees of security, only for the project to be hacked because they missed a critical bug or two.

<br />

### Tincho: security researcher at OpenZeppelin

Q) In terms of security; What are the 3 first things you look at in Smart Contracts? <br />
A) That's an easy one. You go top to bottom. So first 3 things are pragma, imports and the contract's name 😛
The reality is that my specific steps will change depending on what I'm looking at. So I first need to understand what is it that I'm looking at, at least from a conceptual level. So documentation, tests, whitepapers, etc. are handy. And I usually start there. The goal is to understand the architecture and the main roles. I'm a visual thinker, so at this point I draw a lot. I should also say that documentation can be deceiving, so I try to have a healthy distrust for it.

And then there's a handful of things that tend to be quite sensitive, and usual sources of errors. Which is what I think your question is pointing at. So transfers of funds, access controls, complex inheritance chains, upgradeability, external calls to user-controlled targets, assembly, integrations with tokens, integrations with price oracles, heavy math, interfaces with other systems, complex business logic - these are all usual suspects, and I'd say they all deserve attention.

Be ready to read lots of code. Thousands of lines. If you're coming from black box web app testing, you might not be so used to reading code for hours. And at least when it comes to smart contracts, that's a must.

Q) What tools do you use to audit/review contracts? <br />
A) Nothing fancy. At the beginning, whatever let's me draw diagrams. So Slither, Surya and those kind of tools allow me to see inheritance chains, call graphs, exposed functions, etc. That's helpful to see how complex the beast is, and which are the main entry points.
I don't use the Solidity Auditor VS Code extension because I feel it clutters the UI too much, at least for my taste. So usually it's just me reading code, taking notes (either in code with comments or a txt file), drawing stuff, and just thinking. I also think people underestimate the power of pen and paper - I've found bugs just following the logic in pen and paper. And then I'm keen on using the existing test suite of the projects to try out attacks or debug the behavior of complex functions.
For note taking, some fellow auditors use smarter note taking apps such as Obsidian, Roam. Also others use Kanban boards to track their thoughts and exploration paths. I've tried those workflows as well, they can be useful.

Q) What advice do you have for someone coming in for an entry-level position, how do they position themselves to get noticed by security companies out there? What do they do to improve their skills. <br />
A) Good one. Ok so there are two separate questions, not necessarily one tied to the other. Long answer coming!
To improve your skills, I can at least tell you what I did (and continue doing):

- Play every smart contract CTF available out there (in increasing complexity, probably Capture The Ether, Ethernaut, Damn Vulnerable DeFi, Paradigm CTF), and hit your head against the walls until you solve the challenges. At the end it's not about the actual solution what matters, but the learning process you went through to reach that solution.
- Read most (if not all) vulnerability incidents, post mortems and similar material that is published, and take your time to understand them. But distrust the publisher, and actually try to reproduce the exact vulnerability and attack yourself. If you can code proof of concept exploits, that's also cool. I've been doing this quite often lately for vulnerabilities that catch my attention, and honestly it's been a great way to continue learning about vulnerabilities, attack vectors, tooling, etc.
- Skim through published audit reports, and read issues that are interesting for you, if any. You'll learn what kind of things are being found, how they're reported, and how they're solved. Which is a nice exercise - at least has been useful for me.
- Participate in workshops, conferences, etc, either live or watching recordings. Some talks you'll like, some you won't and you'll just close after 5 min. But give yourself the chance to be exposed to something new that's being shared by a security researcher, and probably you'll learn something you did not know, or you'll refresh on previous stuff.
- I haven't done this actually, but I guess that trying to participate in bug bounty programs or in contests can be a cool way to start putting your skills to use, even if the things you end up finding are low/informational. You'll get exposure to real Solidity code and its intricacies, which is always nice.
- Either as an independent security researcher, or as an employee of a security firm, but force yourself to start making a living out of this. You'll get real exposure to code, projects, vulnerabilities, incidents, and all sort of knowledge that you'll only get if you're every single day working on this.
  On how to get noticed, I'd say that usually having a personal blog in which you write about the stuff you learn, research you're doing, CTF challenges you solve, writeups of bounties you've earned, and similar, it's a great way to show your work and skills. Also if you're more of a coder, a public GitHub with your own projects or solid contributions to open-source libraries and tools (related to security) can also be useful. Participating as speaker in security-related conferences is another one. Or just sharing in Twitter cool stuff. I don't know, probably there are lots of other ways, and sometimes even depends on what each security firm is looking for.


### 0xBuns: Co-Founder of @SoulSwap
- Look for attack vectors and check if they can be exploited.
- Most protocols are forks of primitive protocols (i.e., Synthetix, SushiSwap, Pancakeswap, Compound, Uniswap-v2), so understanding those really well will help with majority of audits.

---

# Solidity

Error Handling:

- assert(bool condition): causes a Panic error and thus state change reversion if the condition is not met - to be used for internal errors.
- require(bool condition): reverts if the condition is not met - to be used for errors in inputs or external components.

When to use `memory`, `storage`, or `calldata`:

- Memory: When the var just has to be stored dudring a function execution.
- Calldata: When the var has to be passed around in function calls (i.e., value is passed to another function)
- Storage: When it has to be stored on-chain.

- Having multiple functions with the same naming convention with different params, i.e., `deposit(uint amount)`, `deposit(uint amount, address to)`, act as seperate functions.


## Bonding Curve (aka Curation Markets)
Q) What is it?
A) A Bonding Curve is a mathematical curve that defines a relationship between price and token supply. It allows for a fix and predetermined price discovery mechanism.  

Q) What are some of the curves I can create?
A) List:
- Exponential Curve: The less tokens there are the less the price is. Potentially useful for any type of staking, fractioanlization or an uncapped market (no token supply limit).
- Negative Exponential Curve: The shape of a negative exponential curve allows you to incentivize early investment without heavily disincentivizing late investment.
- Linear: Used when you want a static price vs supply.
- Sigmoid: Bonding curve shapes are used to incentivize the market (interested individuals/organizations). This means that you should match the behavior you want from investors to the type of curve that incentivizes that behavior. (looks like an S)

Q) What is this used for?
A) Brief: Bonding curve shapes are used to incentivize the market (interested individuals/organizations). This means that you should match the behavior you want from investors to the type of curve that incentivizes that behavior.

Examples:
- Price discovery
- Speculation (fractionalizations (secondary tokens))
- Fundraising
- Tokenization

Developer notes
-  Be warned, implementing complex math formulas in Solidity is gas expensive and becomes very complicated very quickly. If you want to implement a complex curve I would recommend looking at Vyper (Curve Finance uses Vyper).
- Taxation: If you wanted to use a bonding curve as a mechanism for fundraising, you need to be able to withdraw collateral (what you pay for the tokens with) from the bonding curve. A buy tax means that you can take a percentage of the collateral for every buy and move it to a different contract/wallet, allowing you to raise money from your bonding curve without having to de-collateralize the distributed tokens. A sell tax, on the other hand, means that token holders pay a fee when they sell tokens rather than buy Lastly, one can tax both sell and buy interactions with the bonding curve contract.

Resources:
- https://www.youtube.com/watch?v=yQktB5CHIRk (Understanding Bonding Curves with Zap)
- https://github.com/bluedotdao/bondzier (Customizable bezier bonding curves)
- https://javascript.info/bezier-curve (Intro to bezier curves)
- https://medium.com/linum-labs/intro-to-bonding-curves-and-shapes-bf326bc4e11a (Intro to bonding curves)
- https://medium.com/molecule-blog/token-bonding-curve-design-parameters-95d365cbec4f (Token Bonding Curve Design Parameters)
- https://blog.relevant.community/how-to-make-bonding-curves-for-continuous-token-models-3784653f8b17 (How to make bonding curves for continuous token models)
- https://blog.relevant.community/bonding-curves-in-depth-intuition-parametrization-d3905a681e0a (In-depth article: how to create bonding curves)

---

# Game Design
1) Learn Unity, especially for 2d games (uses scripting language: C#). This is how everything will interact and move.
2) Learn your artwork creation tool. I.e., learn 2d art to get started bc it's budget friendly, not a ton of lighting, materials, etc so it's friendly over all platforms. Use photoshop for enviornemntal scenes -> import layers + files into Unity -> start animating w/ Spine2d (allows you to add bones + make skeletons to animate them).
3) Learn your sound design tool of choice (i.e, audacity).

### How to build a game
- Build something with replay value: pvp + pve
- Strong progression + sense of achievement: i.e, leaderboards, ranks, cosmetics, items, levels, currency
- Establish target audience: cater to casual (play anywhere) + competitive play (grinding to be the best)

### Resources
- https://www.youtube.com/watch?v=whzomFgjT50 : top-down movement in Unity
- https://www.youtube.com/watch?v=nJbzBSVy1u0 : Attack Animations: Everything You Need To Know
- https://www.youtube.com/watch?v=b8YUfee_pzc : Learn Unity Engine and C# by creating a real top down RPG

---

# Persuasive Design

Techniques used to direct and capture your attention for an extended period of time, inevitably forming habits and creating a dopamine feedback loop to keep you coming back to use the 'product'.

https://line25.com/articles/persuasive-design-101

---

# Investment

- https://www.youtube.com/watch?v=hSHE4Exx1O4 crypto lawyer for moving to portugal + golden visa plan https://map-advogados.com/en/

---

# Life Tips
- Have a big network but not a big inner circle, choose them wisely. Put people who want the same thing as you around you. The attributes of those who are most around you will rub off onto you.
- Always think of opportunity cost. Try to minimise regrets.
- The more you sweat in peace, the less you'll bleed in war.

---

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
- https://medium.com/goldfinch-fi/solidity-learnings-how-to-save-50-on-gas-costs-5e598c364ab2 good overview of gas optimizations (MSTORE, MLOAD, SSTORE, SLOAD)

Security

- https://secureum.substack.com/p/ethereum-101
- https://github.com/leonardoalt/ethereum_formal_verification_overview
- https://github.com/crytic/awesome-ethereum-security

Podcasts

- https://www.youtube.com/watch?v=Pw6ch5c89Iw (Daniele Sesta on popscile finance and MIM, SPELL)

Articles

- https://samczsun.com/author/samczsun/
