def luhn_valid(number: str) -> bool:
    digits = [int(c) for c in number if c.isdigit()]
    if len(digits) < 2:
        return False
    total = 0
    for i, d in enumerate(reversed(digits)):
        if i % 2 == 1:
            d *= 2
            if d > 9:
                d -= 9
        total += d
    return total % 10 == 0


if __name__ == "__main__":
    for n in ["4539 3195 0343 6467", "8273 1232 7352 0569", "0"]:
        print(n, luhn_valid(n))
