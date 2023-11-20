# ULID Generator in Julia

このプロジェクトは、Julia言語でULID（Universally Unique Lexicographically Sortable Identifier）を生成するためのツールです。ULIDは、ユニバーサルに一意であり、辞書順にソート可能な識別子です。

## 機能

- UNIXエポックからのミリ秒単位のタイムスタンプを使用
- ランダムなデータを組み合わせた128ビットの識別子
- 32進数でエンコードされた26文字の文字列

## セットアップ

このコードを使用するには、Juliaがインストールされている必要があります。Juliaのインストールについては、[公式サイト](https://julialang.org/downloads/)を参照してください。

## 使い方

まず、`ulid.jl` ファイルをプロジェクトディレクトリに配置します。次に、Julia REPL（対話型プログラミング環境）で以下の手順に従ってULIDを生成します。

1. `ulid.jl` ファイルを読み込みます。

 ```julia
 include("ulid.jl")

# 構造体のインスタンスを作成します。
ulid_gen = ULID()

# ULIDを生成します。
ulid = generate(ulid_gen)
println(ulid)
```

## ライセンス
このプロジェクトは MIT License の下で公開されています。
