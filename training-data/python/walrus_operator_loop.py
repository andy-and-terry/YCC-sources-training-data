def read_chunks(data, size):
    pos = 0
    while chunk := data[pos:pos + size]:
        yield chunk
        pos += size


if __name__ == "__main__":
    print(list(read_chunks("abcdefghij", 4)))
