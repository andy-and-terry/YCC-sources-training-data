class Counter2(dict):
    def __missing__(self, key):
        self[key] = 0
        return 0

c = Counter2()
for ch in "mississippi":
    c[ch] += 1
print(dict(c))
