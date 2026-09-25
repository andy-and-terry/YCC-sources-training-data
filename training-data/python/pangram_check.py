import string


def is_pangram(sentence: str) -> bool:
    return set(string.ascii_lowercase) <= set(sentence.lower())


if __name__ == "__main__":
    print(is_pangram("The quick brown fox jumps over the lazy dog"))
    print(is_pangram("Hello world"))
