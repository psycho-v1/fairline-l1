# Private 3-validator devnet

Three machines. One collector. One genesis file. No public faucet.

Binary name below is `evmd`. Substitute `fairlined` if you renamed it.

## 0. Same binary

Every operator:

```bash
git clone <your-fork-url>
cd evm
git checkout <agreed-commit>
make install
evmd version
sha256sum "$(which evmd)"
```

Post version + sha256 in the `devnet-0` issue. If hashes diverge, stop.

## 1. Each validator initialises a home

```bash
export CHAIN=fairline-testnet-1
export HOME_DIR="$HOME/.fairline-devnet"
export DENOM=atfln
export DUST=10100000000000000000000   # 10100 tFLN = 10000 bond + 100 fees

rm -rf "$HOME_DIR"
evmd init "$USER-val" --chain-id "$CHAIN" --home "$HOME_DIR"
evmd keys add validator --home "$HOME_DIR" --keyring-backend file
```

Write the mnemonic on paper. Do not put it in git, chat, or a screenshot.

```bash
evmd keys show validator -a --home "$HOME_DIR" --keyring-backend file
evmd tendermint show-validator --home "$HOME_DIR"
evmd tendermint show-node-id --home "$HOME_DIR"
```

Post those three lines in the issue.

## 2. Collector builds genesis

After all three addresses are in the issue:

```bash
evmd genesis add-genesis-account <fair1-val1> ${DUST}${DENOM} --home "$HOME_DIR"
evmd genesis add-genesis-account <fair1-val2> ${DUST}${DENOM} --home "$HOME_DIR"
evmd genesis add-genesis-account <fair1-val3> ${DUST}${DENOM} --home "$HOME_DIR"
```

Each operator:

```bash
evmd genesis gentx validator $DUST$DENOM \
  --chain-id "$CHAIN" \
  --home "$HOME_DIR" \
  --keyring-backend file
```

Collector collects gentxs, then:

```bash
evmd genesis collect-gentxs --home "$HOME_DIR"
sha256sum "$HOME_DIR/config/genesis.json"
```

Commit `genesis.json` to `genesis/testnet-1/genesis.json`.

## 3. Start

```bash
evmd start --home "$HOME_DIR" --chain-id "$CHAIN" --evm-chain-id 482901
```

`eth_chainId` must be 482901 (0x75e35), not 1404, not 262144.
