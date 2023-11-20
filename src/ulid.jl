using UUIDs
using Dates

struct ULID
    TIMESTAMP_LENGTH::Int
    RANDOM_LENGTH::Int
    ULID_LENGTH::Int
    BASE32_CHARS::String
end

function ULID()
    ULID(48, 80, 26, "0123456789ABCDEFGHJKMNPQRSTVWXYZ")
end

function generate(ulid::ULID)
    timestamp = get_timestamp()
    random_part = get_random(ulid)

    # タイムスタンプを80ビット左にシフトし、ランダム部分と組み合わせる
    ulid_value = (UInt128(timestamp) << ulid.RANDOM_LENGTH) | random_part
    encode_ulid(ulid, ulid_value)
end

function encode_ulid(ulid::ULID, value::UInt128)
    encoded = ""
    for _ in 1:ulid.ULID_LENGTH
        encoded = ulid.BASE32_CHARS[(value % 32) + 1] * encoded
        value = value ÷ 32
    end
    return encoded
end

function get_timestamp()
    # Get the current time in milliseconds since UNIX epoch
    return floor(Int, (Dates.datetime2unix(Dates.now()) * 1000))
end

function get_random(ulid::ULID)
    # Generate a random 80-bit integer
    uuid_bytes = UInt128(uuid4()) # UUIDをUInt128として取得
    return uuid_bytes & 0xFFFFFFFFFFFFFFFFFF # 最初の10バイトのみを保持
end

