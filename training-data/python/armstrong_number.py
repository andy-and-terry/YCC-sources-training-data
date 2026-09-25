def is_armstrong(n):
    digits = str(n)
    k = len(digits)
    return n == sum(int(d) ** k for d in digits)


if __name__ == "__main__":
    print([n for n in range(1, 100000) if is_armstrong(n)])
