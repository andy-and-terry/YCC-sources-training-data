from operator import itemgetter, attrgetter, methodcaller
from collections import namedtuple

# operator functions replace small lambdas and are faster.
people = [("ann", 31), ("bob", 25), ("cy", 31)]
print(sorted(people, key=itemgetter(1)))
print(sorted(people, key=itemgetter(1, 0)))  # sort by age, then name

Point = namedtuple("Point", "x y")
pts = [Point(3, 1), Point(1, 2), Point(2, 0)]
print(sorted(pts, key=attrgetter("x")))
print(max(pts, key=attrgetter("y")))

# itemgetter works on dicts and can fetch several keys at once.
rec = {"id": 7, "name": "disk", "size": 512}
print(itemgetter("id", "size")(rec))

# methodcaller calls a named method with fixed arguments.
words = ["  hi ", " there  "]
print(list(map(methodcaller("strip"), words)))
print(list(map(methodcaller("center", 9, "."), ["a", "bb"])))
