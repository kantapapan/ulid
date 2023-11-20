# ULID Library for Julia

This is a Julia module for generating Universally Unique Lexicographically Sortable Identifiers (ULID). ULID is designed as an alternative to UUID and offers the benefits of being sortable and more readable.

## Features

- Generates ULID with a 26-character length.
- Utilizes Crockford's Base32 encoding for better readability and reduced error rates.
- Encodes a 48-bit timestamp (in milliseconds since the UNIX epoch) and an 80-bit random or pseudorandom component.
- Lexicographically sortable and maintains time-series order.
- URL and binary safe.
- Cross-platform and language-independent design.

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

