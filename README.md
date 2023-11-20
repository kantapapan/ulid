# ULID Library for Julia

This is a Julia module for generating Universally Unique Lexicographically Sortable Identifiers (ULID). ULID is designed as an alternative to UUID and offers the benefits of being sortable and more readable.

## Features

- Generates ULID with a 26-character length.
- Utilizes Crockford's Base32 encoding for better readability and reduced error rates.
- Encodes a 48-bit timestamp (in milliseconds since the UNIX epoch) and an 80-bit random or pseudorandom component.
- Lexicographically sortable and maintains time-series order.
- URL and binary safe.
- Cross-platform and language-independent design.


ULID（Universally Unique Lexicographically Sortable Identifier）は、UUID（Universally Unique Identifier）の代替として設計された識別子です。

- ULIDの主な特徴は、文字列としてソート可能であること、および可読性に優れていることです。ここではULIDの実装仕様の詳細を一覧化してみましょう。
- フォーマット: ULIDは26文字の長さを持ち、0123456789ABCDEFGHJKMNPQRSTVWXYZの32文字のCrockfordのBase32エンコーディングを使用します。このエンコーディングは、一部の文字を省略し、誤読を減らすことを意図しています。
- タイムスタンプ部分: 最初の10文字は48ビットのタイムスタンプをエンコードしており、UNIXエポックからのミリ秒単位の時間を表しています。これにより、約89年間のユニークなタイムスタンプを保証しま
す。
- ランダム性部分: 残りの16文字は80ビットのランダムまたは疑似ランダムデータを表しています。これにより、大量のULIDが短時間に生成される場合でも衝突のリスクが低減されます。
- ソート可能: ULIDはレキシコグラフィカル（辞書式）にソート可能であり、生成時のタイムスタンプに基づいて順序付けられます。
- 時系列順序の保存: タイムスタンプ部分のおかげで、ULIDは生成された時系列順にソートすることができます。
- URL安全: ULIDはURLに含めることができる文字のみを使用しています。
- バイナリ安全: ULIDはそのフォーマットがバイナリ形式としても安全であり、データベースやシステム間で容易に交換することができます。
- プラットフォームおよび言語の独立性: ULIDの仕様は多くのプログラミング言語で実装されており、多様なシステムやアプリケーションで使用することができます。
- ULIDは、そのソート可能性、可読性、および時系列順序の保持といった特性により、特に分散システムや大規模なデータセットでの利用に適しています。

## Installation

To install the ULID module, add it to your Julia environment using the following command:
julia> import Pkg; Pkg.add("URL-to-ULID-repository")


Replace `URL-to-ULID-repository` with the actual URL of this repository.

## Usage

Here's how to use the ULID module in your Julia code:

```julia
# Import the module
using ULID

# Generate a new ULID
new_ulid = ULID.generate_ulid()
println("Generated ULID: $new_ulid")
```

## Contributing

Contributions to improve this module are welcome. Please follow these steps to contribute:

    Fork this repository.
    Create a new branch (git checkout -b feature-branch).
    Make your changes and commit (git commit -am 'Add some feature').
    Push to the branch (git push origin feature-branch).
    Create a new Pull Request.

## License

This ULID module is released under the MIT License. See the LICENSE file for more details.
