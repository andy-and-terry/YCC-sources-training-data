#!/usr/bin/env bash
set -euo pipefail

# Bash has no built-in base64 codec, so this delegates to the standard
# `base64` coreutils tool while showing round-trip encode/decode.
message="Hello, Bash!"
encoded=$(printf '%s' "$message" | base64)
decoded=$(printf '%s' "$encoded" | base64 --decode)

echo "Original: $message"
echo "Encoded:  $encoded"
echo "Decoded:  $decoded"
