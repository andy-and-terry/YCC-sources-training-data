def xor_encrypt(data: bytes, key: bytes) -> bytes:
    return bytes(b ^ key[i % len(key)] for i, b in enumerate(data))


def xor_decrypt(data: bytes, key: bytes) -> bytes:
    return xor_encrypt(data, key)  # XOR is symmetric


if __name__ == "__main__":
    key = b"secret"
    ciphertext = xor_encrypt(b"hello world", key)
    print(ciphertext)
    print(xor_decrypt(ciphertext, key))
