# Lazy caterer sequence: max pieces from n cuts
function f(n) { return ((n * (n + 1))/2) + 1 }

BEGIN {
    for (n = 0; n < 10; n++) printf "%d ", int(f(n))
    printf "\n"
}
