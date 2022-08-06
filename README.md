課題４ 最大公約数を計算するシェルスクリプト

URL: https://github.com/fmfer22745137/gcd

## 説明

最大公約数シェルスクリプト

2つの整数を引数として渡した後、最大公約数が出力返されます。
正しくないパラメータで実行した際はエラー終了します。

## テスト

GitHub Actionsを使用

以下はテストを試すために、些細なバグをコミットした後のActionsの出力：

```
Run chmod +x ./test.sh

# Math test

Tested 0 0: NG!
 > Expected: [1]
 >   Actual: [0]
Error: Process completed with exit code 1.
```

バグを修正後、テストが通ります

```
Run chmod +x ./test.sh

# Math test

Tested 0 0: 1 [OK] [ExitCode 0: OK]
Tested 100 0: 1 [OK] [ExitCode 0: OK]
Tested 0 100: 1 [OK] [ExitCode 0: OK]
Tested 2 4: 2 [OK] [ExitCode 0: OK]
Tested 15 10: 5 [OK] [ExitCode 0: OK]
Tested 100 10: 10 [OK] [ExitCode 0: OK]
Tested 100 26: 2 [OK] [ExitCode 0: OK]
Tested 100 25: 25 [OK] [ExitCode 0: OK]
Tested 100 30: 10 [OK] [ExitCode 0: OK]
Tested 1024 768: 256 [OK] [ExitCode 0: OK]
Tested 65535 8092: 17 [OK] [ExitCode 0: OK]

# Error test

Tested -2 4: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested 2 -4: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested -2 -4: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested 0.0 0: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested 100 0.0: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested 0 2.5: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested -10.0 26: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested 1.5 -10: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested -2 -4.1: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested xxx yyy: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested 1 a: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
Tested b 2: Parameters must be two natural numbers [OK] [ExitCode 1: OK]
One arg: Wrong parameter count. Use: gcd.sh <integer> <integer> [OK] [ExitCode 1: OK]
Three args: Wrong parameter count. Use: gcd.sh <integer> <integer> [OK] [ExitCode 1: OK]

```
