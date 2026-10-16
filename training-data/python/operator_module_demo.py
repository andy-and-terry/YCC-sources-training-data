import operator
from functools import reduce

print(operator.add(2, 3), operator.mul(4, 5), operator.neg(7))
print(reduce(operator.mul, range(1, 6)))
print(list(map(operator.itemgetter(0), [(1, "a"), (2, "b")])))
print(operator.attrgetter("real")(3 + 4j))
print(operator.methodcaller("upper")("abc"))
print(operator.contains([1, 2, 3], 2), operator.truth([]))

ops = {"+": operator.add, "-": operator.sub, "*": operator.mul, "/": operator.truediv}
for sym, fn in ops.items():
    print(f"8 {sym} 2 = {fn(8, 2)}")

lst = [1, 2, 3]
operator.setitem(lst, 0, 99)
print(lst, operator.getitem(lst, -1))
