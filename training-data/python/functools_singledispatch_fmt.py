from functools import singledispatch

@singledispatch
def fmt(v):
    return f"obj:{v!r}"

@fmt.register
def _(v: int):
    return f"int:{v:04d}"

@fmt.register
def _(v: list):
    return "[" + ", ".join(fmt(i) for i in v) + "]"

print(fmt(7), fmt([1, 2]), fmt("s"))
