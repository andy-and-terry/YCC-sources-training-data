def longest_collatz(limit: int):
    cache = {1: 1}

    def length(n):
        path = []
        while n not in cache:
            path.append(n)
            n = n // 2 if n % 2 == 0 else 3 * n + 1
        l = cache[n]
        for m in reversed(path):
            l += 1
            cache[m] = l
        return cache[path[0]] if path else l

    return max(range(1, limit), key=length)


if __name__ == "__main__":
    print(longest_collatz(100000))
