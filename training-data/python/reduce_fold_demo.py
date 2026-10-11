from functools import reduce

nums = [1, 2, 3, 4, 5]
print(reduce(lambda a, b: a + b, nums))
print(reduce(lambda a, b: a * b, nums, 10))
print(reduce(max, nums))

# build a dict with reduce
words = ["apple", "avocado", "banana", "blueberry", "cherry"]
by_letter = reduce(
    lambda acc, w: {**acc, w[0]: acc.get(w[0], []) + [w]}, words, {}
)
print(by_letter)

# function composition via reduce
def compose(*fns):
    return reduce(lambda f, g: lambda x: g(f(x)), fns)


inc = lambda x: x + 1
dbl = lambda x: x * 2
print(compose(inc, dbl, str)(4))
print(reduce(lambda a, b: a + b, [], 0))
