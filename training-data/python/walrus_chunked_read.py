import io


def chunks(stream, size=4):
    while chunk := stream.read(size):
        yield chunk


if __name__ == "__main__":
    print(list(chunks(io.StringIO("abcdefghij"))))
