def count_primes_below(n: int) -> int:
    if n < 3:
        return 0
    sieve = bytearray([1]) * n
    sieve[0:2] = b"\x00\x00"
    for i in range(2, int(n ** 0.5) + 1):
        if sieve[i]:
            sieve[i * i::i] = bytearray(len(range(i * i, n, i)))
    return sum(sieve)


if __name__ == "__main__":
    print(count_primes_below(100))
