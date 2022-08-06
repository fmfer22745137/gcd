課題４ 最大公約数を計算するシェルスクリプト

## 説明

最大公約数シェルスクリプト

2つの自然数を引数として渡した後、最大公約数が出力返されます。
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
