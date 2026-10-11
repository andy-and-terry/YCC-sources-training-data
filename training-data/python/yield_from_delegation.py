def flatten(items):
    for item in items:
        if isinstance(item, (list, tuple)):
            yield from flatten(item)
        else:
            yield item


print(list(flatten([1, [2, [3, (4, 5)]], 6])))


def inner():
    x = yield 1
    print("inner got", x)
    return "inner-done"


def outer():
    result = yield from inner()
    print("outer got", result)
    yield 2


g = outer()
print(next(g))
print(g.send("hello"))
