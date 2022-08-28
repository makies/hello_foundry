# Foundry 使ってみたリポジトリ

コミット時の各コマンドバージョン

```shell
forge -V
forge 0.2.0 (f8fe940 2022-08-28T00:04:47.679845Z)

cast -V
cast 0.2.0 (f8fe940 2022-08-28T00:04:47.679845Z)

anvil -V
anvil 0.1.0 (f8fe940 2022-08-28T00:04:47.579014Z)
```

## 公式サイト
https://getfoundry.sh/

## ドキュメント
https://book.getfoundry.sh/

## foundry インストール

```shell
curl -L https://foundry.paradigm.xyz | bash
```

## 環境構築

```shell
git clone https://github.com/makies/hello_foundry.git
cd hello_foundry
forge install
```

## ビルド
```shell
forge build
forge build
[⠔] Compiling...
[⠒] Compiling 3 files with 0.8.16
[⠢] Solc 0.8.16 finished in 466.75ms
Compiler run successful
```


### テスト
```shell
forge test
[⠆] Compiling...
No files changed, compilation skipped

Running 4 tests for test/OwnerUp.t.sol:OwnerUpOnlyTest
[PASS] testAsOwner() (gas: 32018)
[PASS] testFailIncrementAsNotOwner() (gas: 8324)
[PASS] testIncrementAsNotOwner() (gas: 11436)
[PASS] testIncrementAsOwner() (gas: 29200)
Test result: ok. 4 passed; 0 failed; finished in 752.75µs


forge test -vvvv
[⠆] Compiling...
No files changed, compilation skipped

Running 4 tests for test/OwnerUp.t.sol:OwnerUpOnlyTest
[PASS] testAsOwner() (gas: 32018)
Traces:
  [32018] OwnerUpOnlyTest::testAsOwner()
    ├─ [0] VM::prank(0x0000000000000000000000000000000000000001)
    │   └─ ← ()
    ├─ [2262] 0xce71…c246::count() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000000
    ├─ [20392] 0xce71…c246::increment()
    │   └─ ← ()
    ├─ [262] 0xce71…c246::count() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000001
    └─ ← ()

[PASS] testFailIncrementAsNotOwner() (gas: 8324)
Traces:
  [8324] OwnerUpOnlyTest::testFailIncrementAsNotOwner()
    ├─ [0] VM::prank(0x0000000000000000000000000000000000000000)
    │   └─ ← ()
    ├─ [247] 0xce71…c246::increment()
    │   └─ ← 0x82b42900
    └─ ← 0x82b42900

[PASS] testIncrementAsNotOwner() (gas: 11436)
Traces:
  [11436] OwnerUpOnlyTest::testIncrementAsNotOwner()
    ├─ [0] VM::expectRevert(0x82b42900)
    │   └─ ← ()
    ├─ [0] VM::prank(0x0000000000000000000000000000000000000000)
    │   └─ ← ()
    ├─ [247] 0xce71…c246::increment()
    │   └─ ← 0x82b42900
    ├─ [2262] 0xce71…c246::count() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000000
    └─ ← ()

[PASS] testIncrementAsOwner() (gas: 29200)
Traces:
  [29200] OwnerUpOnlyTest::testIncrementAsOwner()
    ├─ [2262] 0xce71…c246::count() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000000
    ├─ [20392] 0xce71…c246::increment()
    │   └─ ← ()
    ├─ [262] 0xce71…c246::count() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000001
    └─ ← ()

Test result: ok. 4 passed; 0 failed; finished in 411.88µs
```
