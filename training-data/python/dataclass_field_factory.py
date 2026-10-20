from dataclasses import dataclass, field, fields, asdict, replace


@dataclass(order=True)
class Task:
    priority: int
    name: str = field(compare=False)
    tags: list = field(default_factory=list, compare=False)
    id: int = field(default=0, init=False, repr=False, compare=False)


if __name__ == "__main__":
    a = Task(2, "write", ["doc"])
    b = Task(1, "read")
    b.tags.append("x")
    print(sorted([a, b]))
    print(a.tags is b.tags, [f.name for f in fields(Task)])
    print(asdict(replace(a, priority=9)))
