def is_automorphic(n: int) -> bool:
    return str(n * n).endswith(str(n))


if __name__ == "__main__":
    print([n for n in range(1, 1000) if is_automorphic(n)])
