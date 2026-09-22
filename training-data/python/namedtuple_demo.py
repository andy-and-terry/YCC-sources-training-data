"""collections.namedtuple vs typing.NamedTuple: lightweight,
immutable, tuple-based records with named field access."""

from collections import namedtuple
from typing import NamedTuple

# Functional-style creation -- fields as a string or list of strings.
Point = namedtuple("Point", ["x", "y"])


class Employee(NamedTuple):
    """Class-based form supports type hints and default values."""
    name: str
    salary: float
    department: str = "general"

    def raise_salary(self, amount: float) -> "Employee":
        return self._replace(salary=self.salary + amount)


if __name__ == "__main__":
    p = Point(3, 4)
    print(p, p.x, p.y)
    print(p == Point(x=3, y=4))
    print(p._asdict())

    x, y = p
    print(x, y)

    e = Employee("Ada", 90000)
    print(e)
    raised = e.raise_salary(5000)
    print(raised)
    print(e)  # original is untouched -- namedtuples are immutable

    try:
        p.x = 10
    except AttributeError as err:
        print(f"immutable: {err}")
