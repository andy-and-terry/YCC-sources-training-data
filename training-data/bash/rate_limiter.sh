#!/usr/bin/env bash
set -euo pipefail

max_tokens=3
tokens=$max_tokens

try_request() {
    local id=$1
    if ((tokens > 0)); then
        ((tokens--))
        echo "request $id: allowed (tokens left: $tokens)"
    else
        echo "request $id: rejected (no tokens)"
    fi
}

for i in 1 2 3 4 5; do
    try_request "$i"
done
