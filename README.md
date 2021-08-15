# MEV-Alpha

- If you keep 1 wei of a token you are trading, you don't need to initialize the storage of a token. If you are trading on something for the first time, it costs a little bit extra gas than if you were to hold that 1 wei amount.
- Sandwiche attack a liquidity providing tx by adding a ton of liquidity before it (front-running) then withdrawing after the user puts their LP in. Why? To get the fees from user providing liquidity. This is effectively making a LP limit order - you need to have a broader perspective on the market + adjust your portfolio to achieve this.
