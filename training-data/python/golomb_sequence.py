def golomb(count: int) -> list[int]:
    # a(n) = 1 + a(n - a(a(n - 1))), using 1-based indexing
    a = [0, 1]
    for n in range(2, count + 1):
        a.append(1 + a[n - a[a[n - 1]]])
    return a[1:]


if __name__ == "__main__":
    print(" ".join(map(str, golomb(20))))
