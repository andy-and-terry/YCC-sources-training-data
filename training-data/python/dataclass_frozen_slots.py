"""Frozen, slotted dataclasses: immutable instances that still get
cross-field validation in __post_init__, and dataclasses.replace() as
the supported way to derive a modified copy."""

from dataclasses import dataclass, field, replace
from datetime import date
from typing import List


@dataclass(frozen=True, slots=True)
class DateRange:
    start: date
    end: date

    def __post_init__(self):
        if self.end < self.start:
            raise ValueError(f"end {self.end} is before start {self.start}")

    def days(self) -> int:
        return (self.end - self.start).days


@dataclass(frozen=True, slots=True)
class Team:
    name: str
    members: List[str] = field(default_factory=list)

    def __post_init__(self):
        if not self.name.strip():
            raise ValueError("team name must not be blank")


if __name__ == "__main__":
    trip = DateRange(date(2024, 1, 1), date(2024, 1, 10))
    print(trip, trip.days())

    extended = replace(trip, end=date(2024, 1, 20))
    print(extended, extended.days())

    try:
        trip.start = date(2024, 2, 1)  # frozen: assignment is rejected
    except AttributeError as e:
        print(f"frozen: {e}")

    try:
        DateRange(date(2024, 5, 1), date(2024, 4, 1))
    except ValueError as e:
        print(e)

    team_a = Team("Alpha")
    team_b = Team("Beta", ["Ada", "Grace"])
    print(team_a, team_b)

    try:
        Team("   ")
    except ValueError as e:
        print(e)
