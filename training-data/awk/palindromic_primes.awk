function is_prime(n,    i) {
    if (n < 2) return 0
    for (i = 2; i * i <= n; i++) if (n % i == 0) return 0
    return 1
}

function is_palindrome(n,    i, len) {
    len = length(n)
    for (i = 1; i <= len / 2; i++)
        if (substr(n, i, 1) != substr(n, len - i + 1, 1)) return 0
    return 1
}

BEGIN {
    for (n = 2; n < 200; n++)
        if (is_palindrome(n) && is_prime(n)) printf "%d ", n
    print "" # 2 3 5 7 11 101 131 151 181 191
}
