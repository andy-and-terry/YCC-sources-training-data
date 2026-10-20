#!/usr/bin/awk -f
function fact(n) { return n <= 1 ? 1 : n * fact(n - 1) }
function fib(n) { return n < 2 ? n : fib(n - 1) + fib(n - 2) }
function gcd(a, b) { return b == 0 ? a : gcd(b, a % b) }
function rev(s,   i, r) { for (i = length(s); i > 0; i--) r = r substr(s, i, 1); return r }
function join(a, n, sep,   i, s) { for (i = 1; i <= n; i++) s = s (i > 1 ? sep : "") a[i]; return s }
function bsearch(a, n, t,   lo, hi, mid) {
    lo = 1; hi = n
    while (lo <= hi) { mid = int((lo + hi) / 2); if (a[mid] == t) return mid; if (a[mid] < t) lo = mid + 1; else hi = mid - 1 }
    return -1
}
BEGIN {
    print fact(10), fib(20), gcd(48, 18), rev("awk")
    n = split("1 3 5 7 9 11", arr, " ")
    print bsearch(arr, n, 7), bsearch(arr, n, 4), join(arr, n, "-")
}
