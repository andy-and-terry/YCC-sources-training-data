#!/usr/bin/env bash
set -euo pipefail

atbash() {
    tr 'a-zA-Z' 'zyxwvutsrqponmlkjihgfedcbaZYXWVUTSRQPONMLKJIHGFEDCBA' <<<"$1"
}

enc=$(atbash 'Hello, World!')
echo "$enc | $(atbash "$enc")"
