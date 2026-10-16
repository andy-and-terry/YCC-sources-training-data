# Late binding gotcha: closures capture variables, not values.
funcs = [lambda: i for i in range(3)]
print([f() for f in funcs])

# Fix 1: default argument binds the current value.
funcs = [lambda i=i: i for i in range(3)]
print([f() for f in funcs])

# Fix 2: factory function creates a new scope.
def make(i):
    return lambda: i


print([make(i)() for i in range(3)])

# Fix 3: functools.partial
from functools import partial
add = lambda a, b: a + b
print([partial(add, i)(10) for i in range(3)])
