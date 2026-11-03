def digit_square_sum(n: int) -> int:
    return sum(int(d) ** 2 for d in str(abs(n)))


if __name__ == "__main__":
    print(digit_square_sum(123))
    print(digit_square_sum(-99))
