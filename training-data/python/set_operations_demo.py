a = {1, 2, 3, 4}
b = {3, 4, 5}

print(a | b, a & b, a - b, a ^ b)
print(a.issubset({1, 2, 3, 4, 5}), a.isdisjoint({9}))
print({1, 2} <= a, a > {1})

seen = set()
dupes = set()
for x in [1, 2, 2, 3, 3, 3]:
    (dupes if x in seen else seen).add(x)
print(sorted(dupes))

frozen = frozenset([1, 2])
print({frozen: "key"})
a.discard(99)
print(a.pop() in {1, 2, 3, 4})
