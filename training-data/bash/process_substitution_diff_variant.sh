#!/usr/bin/env bash
diff <(printf '%s\n' a b c) <(printf '%s\n' a x c) || true
comm -12 <(printf '%s\n' 1 2 3) <(printf '%s\n' 2 3 4)
