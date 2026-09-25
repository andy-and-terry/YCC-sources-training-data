import string

_table = str.maketrans(
    string.ascii_lowercase + string.ascii_uppercase,
    string.ascii_lowercase[::-1] + string.ascii_uppercase[::-1],
)


def atbash(text):
    return text.translate(_table)


if __name__ == "__main__":
    msg = "Hello, World!"
    enc = atbash(msg)
    print(enc, "|", atbash(enc))
