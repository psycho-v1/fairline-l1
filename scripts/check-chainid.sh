#!/usr/bin/env bash
set -euo pipefail
FORBIDDEN=(1404 1337 31337 262144)
ID="${1:-}"
if [[ -z "$ID" && -f params.toml ]]; then
  ID="$(grep -E '^evm_chain_id' params.toml | awk '{print $3}')"
fi
if [[ -z "$ID" ]]; then
  echo "usage: $0 <evm_chain_id>"
  exit 2
fi
for f in "${FORBIDDEN[@]}"; do
  if [[ "$ID" == "$f" ]]; then
    echo "FAIL: evm chain-id $ID is forbidden"
    exit 1
  fi
done
echo "PASS: $ID is not in the local forbidden list"
