from typing import Callable, List


class SortContext:
    def __init__(self, strategy: Callable[[List[int]], List[int]]):
        self.strategy = strategy

    def sort(self, items: List[int]) -> List[int]:
        return self.strategy(items)


def ascending(items):
    return sorted(items)


def descending(items):
    return sorted(items, reverse=True)


if __name__ == "__main__":
    context = SortContext(ascending)
    print(context.sort([5, 3, 8, 1]))
    context.strategy = descending
    print(context.sort([5, 3, 8, 1]))
