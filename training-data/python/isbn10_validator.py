def is_valid_isbn10(isbn: str) -> bool:
    chars = [c for c in isbn if c != "-"]
    if len(chars) != 10:
        return False
    total = 0
    for i, c in enumerate(chars):
        if c == "X" and i == 9:
            value = 10
        elif c.isdigit():
            value = int(c)
        else:
            return False
        total += value * (10 - i)
    return total % 11 == 0


if __name__ == "__main__":
    for s in ["3-598-21508-8", "3-598-21507-X", "3-598-21508-9"]:
        print(s, is_valid_isbn10(s))
