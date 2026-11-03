def is_power_of_two(n: int) -> bool:
    return n > 0 and n & (n - 1) == 0


if __name__ == "__main__":
    print([n for n in range(1, 40) if is_power_of_two(n)])
