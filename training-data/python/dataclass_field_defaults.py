from dataclasses import dataclass, field


@dataclass(order=True)
class Task:
    priority: int
    name: str = field(compare=False)
    tags: list[str] = field(default_factory=list, compare=False)


tasks = sorted([Task(2, "b"), Task(1, "a", ["x"])])
print(tasks)
