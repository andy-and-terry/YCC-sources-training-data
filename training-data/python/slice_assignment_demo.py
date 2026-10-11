xs = list(range(10))
print(xs[2:5], xs[::-1], xs[-3:], xs[::3])

xs[2:5] = ["a", "b"]
print(xs)

xs[1:1] = [100, 200]
print(xs)

del xs[::2]
print(xs)

s = slice(1, None, 2)
print("abcdefg"[s], list(range(10))[s])
print(s.indices(5))

ys = [0] * 5
ys[1:4] = [9] * 3
print(ys)
