def is_harshad(n: int) -> bool:
    return n > 0 and n % sum(int(d) for d in str(n)) == 0


if __name__ == "__main__":
    print([n for n in range(1, 50) if is_harshad(n)])
