import heapq
from dataclasses import dataclass, field
from typing import Any


@dataclass(order=True)
class PrioritizedItem:
    priority: int
    item: Any = field(compare=False)


class PriorityQueue:
    def __init__(self):
        self._heap = []

    def push(self, item, priority: int):
        heapq.heappush(self._heap, PrioritizedItem(priority, item))

    def pop(self):
        return heapq.heappop(self._heap).item

    def is_empty(self):
        return not self._heap


if __name__ == "__main__":
    pq = PriorityQueue()
    pq.push("low", 5)
    pq.push("high", 1)
    pq.push("medium", 3)
    print(pq.pop(), pq.pop(), pq.pop())
