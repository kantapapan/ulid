using Dates
using Test
include("ulid.jl")

@testset "ULID Module Tests" begin
    # generate_ulid()関数のテスト
    @testset "generate_ulid()" begin
        ulid = ULID.generate_ulid()
        @test length(ulid) == 26  # ULIDの文字列長は26であるべき
    end

    # get_timestamp()関数のテスト
    @testset "get_timestamp()" begin
        timestamp = ULID.get_timestamp()
        @test timestamp isa Int  # 戻り値は整数型であるべき
    end

    # get_random_part()関数のテスト
    @testset "get_random_part()" begin
        random_part = ULID.get_random_part()
        @test random_part isa UInt64  # 戻り値はUInt64型であるべき
    end

    # encode_base32()関数のテスト
    @testset "encode_base32()" begin
        number = UInt128(12345678901234567890)  # テスト用のUInt128値
        encoded = ULID.encode_base32(number)
        @test typeof(encoded) == String  # 戻り値は文字列型であるべき
        @test length(encoded) == 26  # エンコードされた文字列の長さは26であるべき
    end
end

