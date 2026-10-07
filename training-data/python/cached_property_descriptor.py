"""A hand-rolled version of functools.cached_property: a non-data
descriptor (no __set__) that computes its value once, stores it in
the instance's __dict__, and is then found there directly on later
lookups -- shadowing the descriptor itself."""

import functools
import time


class lazy_property:
    """__get__ is called only until the instance's own __dict__ gets an
    entry with the same name; after that, normal attribute lookup finds
    the cached value first and never calls __get__ again."""

    def __init__(self, func):
        functools.update_wrapper(self, func)
        self.func = func

    def __set_name__(self, owner, name):
        self.name = name

    def __get__(self, instance, owner=None):
        if instance is None:
            return self
        value = self.func(instance)
        instance.__dict__[self.name] = value
        return value


class Report:
    def __init__(self, rows: list):
        self.rows = rows
        self.compute_calls = 0

    @lazy_property
    def total(self) -> float:
        self.compute_calls += 1
        time.sleep(0.001)  # simulate expensive aggregation
        return sum(self.rows)

    @functools.cached_property
    def average(self) -> float:
        """The standard-library equivalent, for comparison."""
        return sum(self.rows) / len(self.rows)


if __name__ == "__main__":
    report = Report([10, 20, 30, 40])

    print(report.total, report.compute_calls)
    print(report.total, report.compute_calls)  # cached: no second computation

    print(report.average)
    print("average" in report.__dict__)  # cached_property also stores in __dict__
