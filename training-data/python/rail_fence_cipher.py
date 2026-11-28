def rails(n, k):
    pattern = list(range(k)) + list(range(k - 2, 0, -1))
    return [pattern[i % len(pattern)] for i in range(n)]

def encrypt(text, k):
    order = sorted(range(len(text)), key=lambda i: rails(len(text), k)[i])
    return "".join(text[i] for i in order)

def decrypt(cipher, k):
    order = sorted(range(len(cipher)), key=lambda i: rails(len(cipher), k)[i])
    out = [""] * len(cipher)
    for pos, i in enumerate(order):
        out[i] = cipher[pos]
    return "".join(out)

c = encrypt("WEAREDISCOVERED", 3)
print(c, decrypt(c, 3))
