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

### Notes:
- Use `useEffect()` when you want to render something after a rerender when a `[dep]` is changed. E.g, I want to `.map()` my array, `[dillys]`, when the dillys `useState()` is updated next render.

---

## Links

- (How to prevent re-renders on React functional components with React.memo())[https://linguinecode.com/post/prevent-re-renders-react-functional-components-react-memo]
- (How do I listen to events from a smart contract using ethers.js contract.on())[https://stackoverflow.com/questions/68168566/how-do-i-listen-to-events-from-a-smart-contract-using-ethers-js-contract-on-in]
- [Making setInterval Declarative with React Hooks](https://overreacted.io/making-setinterval-declarative-with-react-hooks/)
- [useState set method not reflecting change instantly](https://stackoverflow.com/questions/54069253/usestate-set-method-not-reflecting-change-immediately)