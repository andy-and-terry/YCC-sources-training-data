def luhn_valid(number: str) -> bool:
    digits = [int(c) for c in number if c.isdigit()]
    total = 0
    for i, d in enumerate(reversed(digits)):
        if i % 2 == 1:
            d *= 2
            if d > 9:
                d -= 9
        total += d
    return len(digits) > 1 and total % 10 == 0


def luhn_check_digit(partial: str) -> int:
    for d in range(10):
        if luhn_valid(partial + str(d)):
            return d
    raise AssertionError


if __name__ == "__main__":
    print(luhn_valid("4539 3195 0343 6467"), luhn_valid("8273 1232 7352 0569"))
    print("check digit for 7992739871:", luhn_check_digit("7992739871"))
