#!/usr/bin/env bash
# Pair elements of two arrays together.
names=(alice bob carol)
scores=(90 85 77)
for i in "${!names[@]}"; do
    printf '%-6s => %s\n' "${names[i]}" "${scores[i]}"
done
