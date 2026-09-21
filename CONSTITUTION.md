# Fairline constitution

Working name. Replace before publication. This network is not BlockDAG, not Chain 1404, and not a refund.

1. **Public source.** Mainnet binaries come from a public git tag. Two builders publish matching SHA-256 sums first.
2. **No genesis whale.** The only genesis balances are published validator dust for self-bond and fees. No foundation, MM, investor, or “ecosystem” alloc.
3. **Named accounts.** Every genesis balance is listed in GENESIS_ACCOUNTS.md with role and operator. Unnamed balances are a launch defect.
4. **No consensus blocklist.** Valid transactions are not rejected because an address sits on a list inside the node.
5. **Native asset is not a proxy.** No owner, no mint key, no UUPS on FLN.
6. **Privileged keys die or become governance.** Anything privileged at block 0 is a published timelocked multisig in AUTHORITY.md, then renounced or handed to Governor.
7. **New identity.** Unique Cosmos chain-id, unique EVM chain-id (not 1404), unique P2P name. EIP-155 enforced.
8. **No restitution story.** Optional later claims are gifts on a new ledger. They are not court-ordered restorations of BDAG.
9. **Operators may refuse upgrades.** A tagged binary and a vote do not force a node to run code it rejects.
10. **Break glass in public.** A constitution breach is a halt and a new genesis, not a silent patch.
