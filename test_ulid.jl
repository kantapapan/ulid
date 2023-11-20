using Test
include("../src/ulid.jl") # Adjust the path according to your project structure

module TestULID

using .ULID

# Test that ULID is 26 characters long
@testset "ULID Length Test" begin
    ulid = ULID.generate_ulid()
    @test length(ulid) == 26
end

# Test for timestamp encoding correctness
@testset "Timestamp Encoding Test" begin
    current_timestamp = ULID.get_timestamp()
    ulid = ULID.generate_ulid()
    encoded_timestamp = ulid[1:10]
    # Decoding the timestamp to check if it's approximately equal to the current timestamp
    # Note: Due to the nature of encoding and time elapsed, there might be a slight difference
    decoded_timestamp = ULID.decode_base32_to_timestamp(encoded_timestamp)
    @test abs(decoded_timestamp - current_timestamp) < 1000 # 1000 ms buffer for time elapsed
end

# Test for unique ULID generation
@testset "ULID Uniqueness Test" begin
    ulid1 = ULID.generate_ulid()
    ulid2 = ULID.generate_ulid()
    @test ulid1 != ulid2
end

# Test for lexicographical ordering
@testset "Lexicographical Ordering Test" begin
    ulid1 = ULID.generate_ulid()
    sleep(1) # Ensure a different timestamp
    ulid2 = ULID.generate_ulid()
    @test ulid1 < ulid2
end

end
