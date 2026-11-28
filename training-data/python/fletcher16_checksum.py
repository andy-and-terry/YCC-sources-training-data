def fletcher16(data: bytes) -> int:
    s1 = s2 = 0
    for b in data:
        s1 = (s1 + b) % 255
        s2 = (s2 + s1) % 255
    return (s2 << 8) | s1


if __name__ == "__main__":
    print(hex(fletcher16(b"abcde")))  # 0xc8f0
