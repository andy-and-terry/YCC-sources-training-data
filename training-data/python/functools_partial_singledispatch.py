from functools import partial, singledispatch

# partial pre-binds arguments; singledispatch picks an implementation by first-arg type.
def power(base, exponent):
    return base ** exponent

square = partial(power, exponent=2)

@singledispatch
def describe(value):
    return f"object: {value!r}"

@describe.register
def _(value: int):
    return f"int with {value.bit_length()} bits"

@describe.register
def _(value: list):
    return f"list of {len(value)} items"

if __name__ == "__main__":
    print(square(9))
    print(describe(255), describe([1, 2]), describe("x"))
