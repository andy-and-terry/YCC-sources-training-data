#!/usr/bin/awk -f
function collatz(n,    steps) {
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1
        steps++
    }
    return steps + 0
}
BEGIN {
    split("1 6 7 27", nums, " ")
    for (i = 1; i <= 4; i++)
        printf "collatz(%d) = %d steps\n", nums[i], collatz(nums[i])
}
