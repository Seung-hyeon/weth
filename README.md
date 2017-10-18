# weth
Introducing Ethereum Vega(EVA)

Brief introduce: Ethereum Vega is a hard fork of Ethereum, with a original block rewards served with replay-attack protection. It has hardforked at the block number 4370000 so all ethereum holders before block 4369999 will hold EVA with the same amount.

Technical spec

1. Difficulty adjustment
   - Changed difficulty adjustment algorithm
      - Block 4370000 ~ 4669999 will be mined with difficulty 1024.
      - After block num. 4670000, it will use the same algorithm with Homestead.

2. Block reward
    - 5 EVA will be rewarded per block .

2. Network split
   - Changed network id (7) https://github.com/wjcloud/EIPs/blob/fb5abd51aab494b448b05a52510219589155688c/EIPS/eip-155.md
      - It will ensure that we wouldn't sync or mess up with ETH nodes.
   - Changed default port numbers
      - Changed listening port to 30313, rpc port to 8285
         - This will able running weth and geth together
3. Chain split
    - Forking twice
      - Enabling 300,000 block premine will prevent fork rewrite attack (https://fork.lol/security/fork)
        + It will define that EVA is a different chain, preventing eth-fanboys attacking us.
        + Plus it will be safe from individuals controlling all over.
