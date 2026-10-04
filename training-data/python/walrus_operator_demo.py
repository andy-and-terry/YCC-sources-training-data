"""Assignment expressions (the walrus operator) in common idioms."""
import re


def first_long_word(words, limit=5):
    if (long_words := [w for w in words if len(w) > limit]):
        return long_words[0]
    return None


def read_chunks(data, size):
    pos = 0
    while (chunk := data[pos:pos + size]):
        yield chunk
        pos += size


def main():
    print(first_long_word(["a", "tiny", "elephant", "giraffe"]))
    print(list(read_chunks("abcdefghij", 4)))
    if (m := re.search(r"(\d+)-(\d+)", "range 10-20")):
        print(int(m.group(1)) + int(m.group(2)))
    squares = [y for x in range(6) if (y := x * x) % 2 == 0]
    print(squares)


if __name__ == "__main__":
    main()
