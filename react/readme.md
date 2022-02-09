# React Ethers.js

---

### Example event listener

```
    const buyoutContract = new ethers.Contract(contractAddress, BuyoutFixedABI, provider);
    // "[EVENT_NAME]", ([PARAM], [PARAM], [EVENT_DATA])
    buyoutContract.on("Buyout", (buyer, amount, bonusAmount, cost, event) => {
        console.log("amount", amount);
    });
```

---

## Links

- (How to prevent re-renders on React functional components with React.memo())[https://linguinecode.com/post/prevent-re-renders-react-functional-components-react-memo]
- (How do I listen to events from a smart contract using ethers.js contract.on())[https://stackoverflow.com/questions/68168566/how-do-i-listen-to-events-from-a-smart-contract-using-ethers-js-contract-on-in]
