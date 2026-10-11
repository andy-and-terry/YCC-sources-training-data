from itertools import islice, pairwise, count


def naturals():
    n = 0
    while True:
        yield n
        n += 1


print(list(islice(naturals(), 5)))
print(list(islice(count(10, 5), 4)))
print(list(islice("abcdefgh", 2, 6, 2)))

temps = [20, 22, 21, 25, 24]
print([b - a for a, b in pairwise(temps)])


def batches(it, n):
    it = iter(it)
    while chunk := tuple(islice(it, n)):
        yield chunk


print(list(batches(range(7), 3)))
