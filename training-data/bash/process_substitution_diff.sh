#!/usr/bin/env bash
diff <(printf '%s\n' a b c) <(printf '%s\n' a x c) && echo same || echo different
while read -r line; do echo "got $line"; done < <(seq 1 3)
