"""typing.Generic + TypeVar: a container class parameterized over the
element type, so a type checker can verify Stack[int] never receives a
str, without any runtime cost -- generics are erased at runtime."""

from typing import Generic, List, Optional, TypeVar

T = TypeVar("T")


class Stack(Generic[T]):
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

    def __repr__(self) -> str:
        return f"Stack({self._items!r})"


def first_or_default(items: List[T], default: T) -> T:
    """A generic function: the return type is tied to the argument types."""
    return items[0] if items else default


if __name__ == "__main__":
    int_stack: Stack[int] = Stack()
    int_stack.push(1)
    int_stack.push(2)
    int_stack.push(3)
    print(int_stack, "peek:", int_stack.peek())
    print("popped:", int_stack.pop())
    print(int_stack)

    str_stack: Stack[str] = Stack()
    str_stack.push("a")
    str_stack.push("b")
    print(str_stack)

    print(first_or_default([10, 20], 0))
    print(first_or_default([], -1))
