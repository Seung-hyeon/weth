# Went-ethereum(WETH)

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ethereumvega1/Lobby?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

a
## Introducing Ethereum Vega(EVA)

Ethereum Vega is a hard fork of Ethereum, with a original block rewards served with replay-attack protection. It has hardforked at the block number 4370000 so all ethereum holders before block 4369999 will hold EVA with the same amount of ETH.

## Technical spec

1. Difficulty adjustment
   - Changed difficulty adjustment algorithm
      - Block 4370000 ~ 4669999 will be mined with difficulty 1024.
      - After block num. 4670000, it will use the same algorithm with Homestead.

2. Block reward
    - About 1,500,000 EVA will be premined after EVA fork.
      - Less then.
      - This will ensure that we are different from ETH chain (from byzantium and homestead).
    - 5 EVA will be rewarded per block.
      - Immutable and sustainable monetary issurance keeps us decentralized and secure.
      - This will make us free from 3rd party interference.
    - Total 1 billion block supply.(This would be likely to be changed by consensus)
      - We will have a halving when total supply reaches 50% of max supply.
      - Then, It will have a halving event when total suply reaches 75% of max supply.
      - For short, block rewards will halve when coin supply reaches 50% of geometric series(https://en.wikipedia.org/wiki/Geometric_series#Sum).
      - Halving block will keep the network decentralized, immutable with no harm from inflation or centralized governance, 3rd party interference.
      

2. Network split
   - Changed network id and chain id (7) https://github.com/wjcloud/EIPs/blob/fb5abd51aab494b448b05a52510219589155688c/EIPS/eip-155.md
      - It will ensure that we wouldn't sync or mess up with ETH nodes.
      - And this will protect us from replay attacks(replaying transaction that is already played in ETH)
   - Changed default port numbers
      - Changed listening port to 30313, rpc port to 8285
         - This will able running weth and geth together
3. Chain split
    - Forking twice
      - Enabling premine will prevent fork rewrite attack (https://fork.lol/security/fork)
        + It will define that EVA is a different chain, preventing eth-fanboys attacking us.
        + Plus it will be safe from individuals controlling all over.
