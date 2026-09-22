#!/usr/bin/env bash
set -euo pipefail

text="Hello, Bash World!"

echo "original:  $text"
echo "uppercase: ${text^^}"
echo "lowercase: ${text,,}"
echo "first-up:  ${text^}"
echo "first-low: ${text,}"
