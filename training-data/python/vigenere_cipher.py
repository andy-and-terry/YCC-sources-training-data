def _shift(text, key, sign):
    out = []
    k = 0
    for ch in text:
        if ch.isalpha():
            base = ord("A") if ch.isupper() else ord("a")
            s = ord(key[k % len(key)].lower()) - ord("a")
            out.append(chr((ord(ch) - base + sign * s) % 26 + base))
            k += 1
        else:
            out.append(ch)
    return "".join(out)


def encrypt(text, key):
    return _shift(text, key, 1)


def decrypt(text, key):
    return _shift(text, key, -1)


if __name__ == "__main__":
    c = encrypt("Attack at dawn!", "LEMON")
    print(c, "->", decrypt(c, "LEMON"))
