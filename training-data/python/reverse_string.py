def reverse_string(s: str) -> str:
    return s[::-1]


def reverse_words(s: str) -> str:
    return " ".join(reversed(s.split()))


if __name__ == "__main__":
    print(reverse_string("hello"))
    print(reverse_words("the quick brown fox"))
