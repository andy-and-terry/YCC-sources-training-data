#!/usr/bin/env bash
set -euo pipefail

# Floating point via bc with 20 digits of scale.
newton_sqrt() {
    bc -l <<EOF2
scale = 20
x = $1
g = x / 2
if (x < 1) g = 1
for (i = 0; i < 60; i++) { g = (g + x / g) / 2 }
g
EOF2
}

for x in 2 9 0.25 10000000000; do
    printf 'sqrt(%s) = %.12f (bc: %.12f)\n' "$x" "$(newton_sqrt "$x")" "$(bc -l <<<"sqrt($x)")"
done

# Newton's method on f(x) = cos(x) - x using bc's c() and s().
bc -l <<'EOF2'
scale = 20
x = 1
for (i = 0; i < 20; i++) { x = x - (c(x) - x) / (-s(x) - 1) }
print "root of cos(x) - x: ", x, "\n"
EOF2
