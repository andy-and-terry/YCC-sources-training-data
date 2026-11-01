# Number of ways to write n as a sum of two or more consecutive positive integers.
def polite_ways(n):
    ways = 0
    k = 2
    while k * (k + 1) // 2 <= n:
        # n = a + (a+1) + ... + (a+k-1)  =>  a = (n - k(k-1)/2) / k
        rest = n - k * (k - 1) // 2
        if rest % k == 0:
            ways += 1
        k += 1
    return ways

print(*[polite_ways(n) for n in range(1, 17)])
