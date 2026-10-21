def kaprekar_steps(n: int) -> int:
    steps = 0
    while n != 6174:
        digits = f"{n:04d}"
        n = int("".join(sorted(digits, reverse=True))) - int("".join(sorted(digits)))
        steps += 1
    return steps


if __name__ == "__main__":
    print(kaprekar_steps(3524))
