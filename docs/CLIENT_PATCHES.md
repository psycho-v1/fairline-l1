# Client patches for Fairline identity

Upstream: https://github.com/cosmos/evm
Apply on a fork before the first Fairline peer. Line numbers move; search for the strings.

## 1. Bech32 prefix

File: `evmd/config/bech32.go`

`Bech32Prefix = "cosmos"` becomes `Bech32Prefix = "fair"`

Rebuild. `evmd keys add` should print `fair1...` addresses.

## 2. Denoms

File: `testutil/constants/constants.go`

- `aatom` → `atfln`
- `atom` → `tfln`
- keep 18 decimals

## 3. Chain IDs at start

```
evmd start \
  --chain-id fairline-testnet-1 \
  --evm-chain-id 482901
```

## 4. Forbidden leftovers

```
rg -n "262144|1404|Bech32Prefix = \"cosmos\"|gesture inject test"
```

## 5. Reproduce

```
git rev-parse HEAD
sha256sum $(which evmd)
```

Two operators must report the same hash for the same tag.
