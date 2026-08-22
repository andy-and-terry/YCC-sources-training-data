import base64


def encode_bytes(data: bytes) -> str:
    return base64.b64encode(data).decode("ascii")


def decode_string(text: str) -> bytes:
    return base64.b64decode(text.encode("ascii"))


if __name__ == "__main__":
    encoded = encode_bytes(b"hello world")
    print(encoded)
    print(decode_string(encoded))
