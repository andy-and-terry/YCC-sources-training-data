from operator import attrgetter, itemgetter, methodcaller
from types import SimpleNamespace as NS


if __name__ == "__main__":
    people = [NS(name="Ann", age=30, city="Oslo"), NS(name="Bo", age=25, city="Rome"),
              NS(name="Cy", age=30, city="Bern")]
    print([p.name for p in sorted(people, key=attrgetter("age", "city"))])
    rows = [("x", 3), ("y", 1), ("z", 2)]
    print(sorted(rows, key=itemgetter(1)))
    print(list(map(methodcaller("title"), ["ab cd", "ef"])))
    print(max(people, key=attrgetter("age")).name)
