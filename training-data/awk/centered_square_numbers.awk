# Centered square numbers 2n(n+1)+1
function f(n) { return ((2 * n) * (n + 1)) + 1 }

BEGIN {
    for (n = 0; n < 10; n++) printf "%d ", int(f(n))
    printf "\n"
}
