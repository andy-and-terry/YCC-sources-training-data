from operator import itemgetter, attrgetter
from dataclasses import dataclass

people = [("ann", 30), ("bob", 25), ("cat", 30), ("dan", 25)]
print(sorted(people, key=itemgetter(1)))
print(sorted(people, key=lambda p: (-p[1], p[0])))


@dataclass
class Emp:
    name: str
    dept: str
    pay: int


emps = [Emp("a", "x", 3), Emp("b", "y", 1), Emp("c", "x", 2)]
print([e.name for e in sorted(emps, key=attrgetter("dept", "pay"))])
print(max(emps, key=attrgetter("pay")).name)

# stable sort: sort by secondary key first, then primary
words = ["bb", "a", "cc", "d", "aaa"]
words.sort()
words.sort(key=len)
print(words)
