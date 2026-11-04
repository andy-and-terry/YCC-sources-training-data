def zigzag(s, rows):
    if rows == 1 or rows >= len(s):
        return s
    lines = [""] * rows
    r, step = 0, 1
    for ch in s:
        lines[r] += ch
        if r == 0:
            step = 1
        elif r == rows - 1:
            step = -1
        r += step
    return "".join(lines)


print(zigzag("PAYPALISHIRING", 3))  # PAHNAPLSIIGYIR
print(zigzag("PAYPALISHIRING", 4))  # PINALSIGYAHRPI
