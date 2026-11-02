from functools import singledispatch

@singledispatch
def fmt(x): return repr(x)

@fmt.register(int)
def _(x): return f"int:{x}"

@fmt.register(list)
def _(x): return "[" + ", ".join(map(fmt, x)) + "]"

print(fmt([1, "a", [2]]))
