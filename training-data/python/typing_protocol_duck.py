from typing import Protocol


class Speaker(Protocol):
    def speak(self) -> str: ...


class Dog:
    def speak(self) -> str:
        return "woof"


def talk(s: Speaker) -> None:
    print(s.speak())


if __name__ == "__main__":
    talk(Dog())
