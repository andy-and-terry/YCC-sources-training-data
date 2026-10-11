first, *middle, last = [1, 2, 3, 4, 5]
print(first, middle, last)

head, *_ = "hello"
print(head)

(a, b), (c, d) = (1, 2), (3, 4)
print(a, b, c, d)

a, b = b, a
print(a, b)

merged = [*range(3), *"ab", *(10, 20)]
print(merged)

defaults = {"color": "red", "size": 1}
override = {"size": 5}
print({**defaults, **override})


def f(*args, **kwargs):
    return args, kwargs


print(f(*[1, 2], **{"k": "v"}))
