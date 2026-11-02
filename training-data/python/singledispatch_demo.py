from functools import singledispatch

@singledispatch
def describe(x):
    return "something"

@describe.register
def _(x: int):
    return f"int {x}"

@describe.register
def _(x: list):
    return f"list of {len(x)}"

print(describe(3), describe([1, 2]), describe("s"))
