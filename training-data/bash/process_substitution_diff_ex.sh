#!/usr/bin/env bash
diff <(printf '%s\n' a b c) <(printf '%s\n' a x c) || true
while read -r line; do echo "> $line"; done < <(seq 1 3)
