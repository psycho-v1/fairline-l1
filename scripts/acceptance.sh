#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RPC="${RPC:-http://127.0.0.1:8545}"
EXPECT_ID="${EXPECT_ID:-}"
if [[ -z "$EXPECT_ID" && -f "$ROOT/params.toml" ]]; then
  EXPECT_ID="$(grep -E '^evm_chain_id' "$ROOT/params.toml" | awk '{print $3}')"
fi
echo "RPC=$RPC EXPECT_ID=${EXPECT_ID:-unset}"
chain_hex="$(curl -sS -X POST "$RPC" -H 'content-type: application/json' --data '{"jsonrpc":"2.0","id":1,"method":"eth_chainId","params":[]}' | python3 -c 'import json,sys; print(json.load(sys.stdin).get("result",""))' || true)"
if [[ -z "$chain_hex" ]]; then
  echo "FAIL  eth_chainId empty — is the node up?"
  exit 1
fi
chain_dec=$((chain_hex))
echo "eth_chainId = $chain_hex ($chain_dec)"
[[ $chain_dec -ne 1404 ]]
[[ $chain_dec -ne 262144 ]]
if [[ -n "$EXPECT_ID" ]]; then
  [[ $chain_dec -eq $EXPECT_ID ]]
fi
echo PASS
