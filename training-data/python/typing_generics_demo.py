"""Generic classes and functions using TypeVar/Generic, plus a structural Protocol."""

from typing import Generic, Protocol, TypeVar

T = TypeVar("T")


class Stack(Generic[T]):
    def __init__(self) -> None:
        self._items: list[T] = []

    def push(self, item: T) -> None:
        self._items.append(item)

    def pop(self) -> T:
        return self._items.pop()

    def peek(self) -> T:
        return self._items[-1]

    def is_empty(self) -> bool:
        return not self._items


class Comparable(Protocol):
    def __lt__(self, other) -> bool: ...


CT = TypeVar("CT", bound=Comparable)


def max_of(items: list) -> object:
    best = items[0]
    for item in items[1:]:
        if best < item:
            best = item
    return best


if __name__ == "__main__":
    ints: Stack[int] = Stack()
    ints.push(1)
    ints.push(2)
    ints.push(3)
    print(ints.pop(), ints.peek())

    words: Stack[str] = Stack()
    words.push("a")
    words.push("b")
    print(words.pop())

    print(max_of([3, 1, 4, 1, 5, 9, 2, 6]))
    print(max_of(["pear", "apple", "cherry"]))
