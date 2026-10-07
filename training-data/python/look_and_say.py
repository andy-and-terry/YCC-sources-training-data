from itertools import groupby


def next_term(s: str) -> str:
    return "".join(f"{len(list(g))}{k}" for k, g in groupby(s))


def sequence(n: int):
    s = "1"
    for _ in range(n):
        yield s
        s = next_term(s)


if __name__ == "__main__":
    print(list(sequence(8)))
