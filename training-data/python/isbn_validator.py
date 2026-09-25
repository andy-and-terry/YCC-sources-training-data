def isbn10_valid(s):
    s = s.replace("-", "")
    if len(s) != 10 or not s[:9].isdigit() or not (s[9].isdigit() or s[9] in "Xx"):
        return False
    total = sum((10 - i) * int(c) for i, c in enumerate(s[:9]))
    total += 10 if s[9] in "Xx" else int(s[9])
    return total % 11 == 0


def isbn13_valid(s):
    s = s.replace("-", "")
    if len(s) != 13 or not s.isdigit():
        return False
    total = sum(int(c) * (1 if i % 2 == 0 else 3) for i, c in enumerate(s))
    return total % 10 == 0


def isbn10_to_13(s):
    core = "978" + s.replace("-", "")[:9]
    check = (10 - sum(int(c) * (1 if i % 2 == 0 else 3) for i, c in enumerate(core)) % 10) % 10
    return core + str(check)


if __name__ == "__main__":
    print(isbn10_valid("0-306-40615-2"), isbn10_valid("0-306-40615-3"))
    print(isbn13_valid("978-0-306-40615-7"))
    print(isbn10_to_13("0-306-40615-2"))
