def varint(n: int) -> bytes:
    out = bytearray()
    while n >= 0x80:
        out.append((n & 0x7F) | 0x80)
        n >>= 7
    out.append(n)
    return bytes(out)


def decode(b: bytes) -> int:
    return sum((x & 0x7F) << (7 * i) for i, x in enumerate(b))


if __name__ == "__main__":
    print(varint(300).hex(), decode(varint(300)))
