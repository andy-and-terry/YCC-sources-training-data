def affine(text, a, b, decrypt=False):
    inv = pow(a, -1, 26)
    out = []
    for ch in text.upper():
        if ch.isalpha():
            x = ord(ch) - 65
            y = (inv * (x - b)) % 26 if decrypt else (a * x + b) % 26
            out.append(chr(y + 65))
        else:
            out.append(ch)
    return "".join(out)

c = affine("AFFINE", 5, 8)
print(c, affine(c, 5, 8, decrypt=True))
