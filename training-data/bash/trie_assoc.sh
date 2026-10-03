#!/usr/bin/env bash
set -euo pipefail

# Simulate a trie with an associative array keyed by prefix, and a
# separate set of "complete word" markers.
declare -A trie_nodes
declare -A word_end

trie_insert() {
    local word=$1
    local prefix=""
    local i ch
    for ((i = 0; i < ${#word}; i++)); do
        ch=${word:i:1}
        prefix+="$ch"
        trie_nodes[$prefix]=1
    done
    word_end[$word]=1
}

trie_search() {
    local word=$1
    [[ -n "${word_end[$word]:-}" ]]
}

trie_starts_with() {
    local prefix=$1
    [[ -n "${trie_nodes[$prefix]:-}" ]]
}

for w in cat car card dog; do
    trie_insert "$w"
done

trie_search "car" && echo "car: found" || echo "car: missing"
trie_search "ca" && echo "ca: found" || echo "ca: missing"
trie_starts_with "ca" && echo "prefix ca: found" || echo "prefix ca: missing"
trie_starts_with "do" && echo "prefix do: found" || echo "prefix do: missing"
