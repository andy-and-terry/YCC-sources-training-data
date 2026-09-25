"""Generic classes and functions with TypeVar/Generic: write a
container or algorithm once and have static type checkers track the
element type through it, plus a bounded TypeVar restricted to types
that support comparison."""

from typing import Generic, List, Optional, Protocol, TypeVar

T = TypeVar("T")


class Comparable(Protocol):
    def __lt__(self, other) -> bool: ...


C = TypeVar("C", bound=Comparable)


class Stack(Generic[T]):
    """A generic LIFO stack -- works for any element type T, and a type
    checker will flag mixing types in the same stack."""

    def __init__(self) -> None:
        self._items: List[T] = []

    def push(self, item: T) -> None:
        self._items.append(item)

    def pop(self) -> T:
        if not self._items:
            raise IndexError("pop from empty stack")
        return self._items.pop()

    def peek(self) -> Optional[T]:
        return self._items[-1] if self._items else None

    def __len__(self) -> int:
        return len(self._items)


def smallest(items: List[C]) -> C:
    """Bounded TypeVar: only accepts element types that implement <,
    and returns that same type back."""
    current = items[0]
    for item in items[1:]:
        if item < current:
            current = item
    return current


class Pair(Generic[T]):
    def __init__(self, first: T, second: T):
        self.first = first
        self.second = second

    def swapped(self) -> "Pair[T]":
        return Pair(self.second, self.first)

    def __repr__(self) -> str:
        return f"Pair({self.first!r}, {self.second!r})"


if __name__ == "__main__":
    ints: Stack[int] = Stack()
    ints.push(1)
    ints.push(2)
    ints.push(3)
    print(ints.pop(), len(ints))

    words: Stack[str] = Stack()
    words.push("a")
    words.push("b")
    print(words.peek())

    print(smallest([5, 3, 8, 1, 9]))
    print(smallest(["pear", "apple", "kiwi"]))

    pair = Pair(1, "one")
    print(pair, pair.swapped())
