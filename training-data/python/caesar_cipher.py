def encrypt(text: str, shift: int) -> str:
    result = []
    for ch in text:
        if ch.isalpha():
            base = ord("A") if ch.isupper() else ord("a")
            result.append(chr((ord(ch) - base + shift) % 26 + base))
        else:
            result.append(ch)
    return "".join(result)


def decrypt(text: str, shift: int) -> str:
    return encrypt(text, -shift)


if __name__ == "__main__":
    cipher = encrypt("Hello, World!", 3)
    print(cipher)
    print(decrypt(cipher, 3))
