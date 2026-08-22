def binary_to_decimal(binary: str) -> int:
    return int(binary, 2)


def decimal_to_binary(n: int) -> str:
    if n == 0:
        return "0"
    digits = []
    while n > 0:
        digits.append(str(n % 2))
        n //= 2
    return "".join(reversed(digits))


if __name__ == "__main__":
    print(binary_to_decimal("1010"))
    print(decimal_to_binary(10))
