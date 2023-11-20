using Test
include("ulid.jl") # ULIDコードファイルのパスを指定

# ULIDインスタンスの作成
ulid_gen = ULID()

# ULIDの長さが26文字であることをテスト
@test length(generate(ulid_gen)) == 26

# ULIDが正しい文字セットを使用していることをテスト
@test all(c -> c in ulid_gen.BASE32_CHARS, generate(ulid_gen))

# 生成されたULIDが一意であることを確認するためのテスト
@test generate(ulid_gen) != generate(ulid_gen)

# タイムスタンプ部分が時間の経過とともに増加することをテスト
ulid1 = generate(ulid_gen)
sleep(2) # 2秒待機
ulid2 = generate(ulid_gen)
@test ulid1[1:10] != ulid2[1:10] # タイムスタンプ部分の比較

# ULIDエンコードの妥当性をテスト（オプショナル）
@test typeof(generate(ulid_gen)) == String

println("All tests passed!")

