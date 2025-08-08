# Command used

`nix develop github:gustavo-grieco/echidna/dev-keccak-collection#fuzz`

# New Crash
Only able to repro in the nix preview

```
[2025-08-08 17:22:22.83]  Saved reproducer to echidna/coverage/4214100104470469401.txt
[2025-08-08 17:22:22.84] [Worker 2] Crashed:

Data.ByteString.index: index too large: 10, length = 10
CallStack (from HasCallStack):
  error, called at libraries/bytestring/Data/ByteString.hs:2078:23 in bytestring-0.12.1.0-d76e:Data.ByteString
  moduleError, called at libraries/bytestring/Data/ByteString.hs:1259:24 in bytestring-0.12.1.0-d76e:Data.ByteString
  index, called at src/EVM/ABI.hs:268:34 in hevm-0.55.1-Fay0uBwb65P4ZFEmWTGd16:EVM.ABI

Please report it to https://github.com/crytic/echidna/issues
```



# Bug present in Echidna 2.2.6

If you run with 16 workers, and kill the process, echidna doesn't stop

Unclear if something is happening in the background.

# Coverage Report is empty

For some reason Morpho.sol has empty coverage in the nix preview