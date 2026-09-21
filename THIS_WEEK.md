# This week — first steps only

Goal by Sunday: a **private 3-validator devnet** that is not 1404, not mainnet, and not announced as live.

Not a goal: mainnet genesis, airdrop contract, Telegram token ticker, exchange talk.

Repo: https://github.com/psycho-v1/fairline-l1

## People you need before Tuesday

Three operators. Each has:

- A Linux or macOS machine they control
- 4 CPU / 8 GB RAM / 40 GB disk is enough for devnet
- They generate keys **on that machine**. Nobody mails a seed.

Write their names in `OPERATORS.md` today. If you only have one person, stop. A one-operator “devnet” is just a laptop.

## Day by day

### Day 1 — paper

Done on 2026-09-21 except two more named operators.

### Day 2 — public repo, still no chain

1. Repo created: https://github.com/psycho-v1/fairline-l1
2. Open tracking issue `devnet-0`
3. Each operator installs Go 1.23.8+ and build tools. Do not build yet if you have not agreed the name.

### Day 3 — learn the upstream binary (throwaway)

On **one** machine only:

```bash
git clone https://github.com/cosmos/evm.git
cd evm
./local_node.sh -y
```

Confirm MetaMask can talk to `http://localhost:8545`.

Then **delete that data**. That process uses chain-id 262144 and a public test seed. It is not Fairline.

### Day 4 — apply Fairline identity

Fork `cosmos/evm`. See `docs/CLIENT_PATCHES.md`.

### Day 5–7 — private 3-validator net

Follow `docs/VALIDATOR_DEVNET.md`.
