import itertools

data = sorted("aabbbcdd")
print([(k, len(list(g))) for k, g in itertools.groupby(data)])
print(list(itertools.chain([1, 2], (3,), "ab")))
print(list(itertools.product("ab", [0, 1])))
print(list(itertools.islice(itertools.count(10, 5), 4)))
print(list(itertools.accumulate([1, 2, 3, 4])))
