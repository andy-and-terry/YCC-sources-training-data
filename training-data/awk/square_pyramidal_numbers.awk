# Square pyramidal numbers n(n+1)(2n+1)/6
function f(n) { return ((n * (n + 1)) * ((2 * n) + 1))/6 }

BEGIN {
    for (n = 0; n < 10; n++) printf "%d ", int(f(n))
    printf "\n"
}
