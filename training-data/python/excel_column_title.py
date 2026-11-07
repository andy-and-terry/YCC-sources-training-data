def column_title(n):
    out = []
    while n > 0:
        n, rem = divmod(n - 1, 26)
        out.append(chr(ord("A") + rem))
    return "".join(reversed(out))


def column_number(title):
    n = 0
    for ch in title:
        n = n * 26 + ord(ch) - ord("A") + 1
    return n


print(column_title(28), column_title(701))  # AB ZY
print(column_number("ZY"))  # 701
