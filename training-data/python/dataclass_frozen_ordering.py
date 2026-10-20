from dataclasses import dataclass, field, replace


@dataclass(frozen=True, order=True)
class Version:
    major: int
    minor: int = 0
    patch: int = 0
    label: str = field(default="", compare=False)

    def bump_minor(self):
        return replace(self, minor=self.minor + 1, patch=0)


if __name__ == "__main__":
    versions = [Version(1, 2, 3), Version(1, 10), Version(0, 9, 9, "beta")]
    print(sorted(versions))
    print(Version(1, 2, 3).bump_minor())
