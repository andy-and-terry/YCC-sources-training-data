from dataclasses import dataclass, field


@dataclass(frozen=True, order=True)
class Version:
    major: int
    minor: int = 0
    tags: tuple = field(default=(), compare=False)


vs = sorted([Version(1, 5), Version(1, 2, ("rc",)), Version(0, 9)])
print(vs)
print(Version(1, 2) == Version(1, 2, ("x",)))
