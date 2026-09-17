"""typing.Protocol: structural ("duck") typing checked statically.

Any object exposing a matching `speak()` method satisfies `Speaker`,
with no explicit inheritance required.
"""

from typing import Protocol, runtime_checkable


@runtime_checkable
class Speaker(Protocol):
    def speak(self) -> str:
        ...


class Dog:
    def speak(self) -> str:
        return "Woof!"


class Robot:
    def speak(self) -> str:
        return "BEEP BOOP"


class Rock:
    pass


def announce(speaker: Speaker) -> None:
    print(speaker.speak())


if __name__ == "__main__":
    for candidate in [Dog(), Robot(), Rock()]:
        if isinstance(candidate, Speaker):
            announce(candidate)
        else:
            print(f"{type(candidate).__name__} does not implement Speaker")
