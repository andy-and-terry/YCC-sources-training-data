#!/usr/bin/env bash
set -euo pipefail

# Complex arithmetic via awk; numbers are passed as "re im" pairs.
cx() {
    awk -v op="$1" -v a="$2" -v b="$3" -v c="${4:-0}" -v d="${5:-0}" 'BEGIN {
        if (op == "add") { re = a + c; im = b + d }
        else if (op == "mul") { re = a * c - b * d; im = a * d + b * c }
        else if (op == "div") { den = c * c + d * d; re = (a * c + b * d) / den; im = (b * c - a * d) / den }
        else if (op == "abs") { printf "%g\n", sqrt(a * a + b * b); exit }
        printf "%g%+gi\n", re, im
    }'
}

echo "z=3+4i w=1-2i"
echo "z+w = $(cx add 3 4 1 -2)"
echo "z*w = $(cx mul 3 4 1 -2)"
echo "z/w = $(cx div 3 4 1 -2)"
echo "|z| = $(cx abs 3 4)"

# Small Mandelbrot plot, iterating z = z^2 + c inside awk for speed.
awk 'BEGIN {
    for (y = 6; y >= -6; y--) {
        row = ""
        for (x = -20; x <= 8; x++) {
            cr = x / 10; ci = y / 6; zr = 0; zi = 0
            for (i = 0; i < 30 && zr * zr + zi * zi <= 4; i++) {
                t = zr * zr - zi * zi + cr; zi = 2 * zr * zi + ci; zr = t
            }
            row = row (i == 30 ? "#" : ".")
        }
        print row
    }
}'
