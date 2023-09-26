module ULID

using Dates

import Base: rand
import Dates: now, DateTime, Millisecond

# Constants for ULID
const CROCKFORD_BASE32 = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"

# Function to generate a ULID
function generate_ulid()
    timestamp = get_timestamp()
    random_part = UInt128(get_random_part())
    encode_base32(timestamp * 2^80 + random_part)
end

# Function to get the current timestamp in milliseconds since UNIX epoch
function get_timestamp()
    datetime = now()
    return Int(floor(Dates.datetime2unix(datetime) * 1000))
end

# Function to generate the random part of the ULID
function get_random_part()
    return rand(UInt64) * 2^16 + rand(UInt16)
end

# Function to encode a number into base32
function encode_base32(number::UInt128)
    encoded = ""
    for i in 1:26
        digit = number % 32
        number = number ÷ 32
        encoded = CROCKFORD_BASE32[digit + 1] * encoded
    end
    return encoded
end

end
