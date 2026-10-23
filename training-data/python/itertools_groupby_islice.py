from itertools import groupby, islice, accumulate, chain, product, pairwise

data = sorted("aabbbcdd")
print([(k, len(list(g))) for k, g in groupby(data)])
print(list(islice(chain.from_iterable([[1, 2], [3, 4], [5]]), 1, 4)))
print(list(accumulate([1, 2, 3, 4], lambda a, b: a * b)))
print(list(product("ab", repeat=2)))
print(list(pairwise([1, 4, 9, 16])))
