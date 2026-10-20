from itertools import tee


def pairwise(iterable):
    a, b = tee(iterable)
    next(b, None)
    return zip(a, b)


if __name__ == "__main__":
    print(list(pairwise([1, 4, 9, 16])))
