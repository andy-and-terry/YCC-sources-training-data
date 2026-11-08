from itertools import accumulate


def encode(xs):
    return [xs[0]] + [b - a for a, b in zip(xs, xs[1:])]


def decode(ds):
    return list(accumulate(ds))


if __name__ == "__main__":
    d = encode([10, 12, 15, 15, 20])
    print(d, decode(d))
