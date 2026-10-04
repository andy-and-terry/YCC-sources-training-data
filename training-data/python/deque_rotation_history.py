"""collections.deque as a bounded history buffer and a rotating ring."""

from collections import deque


class RecentHistory:
    def __init__(self, limit: int):
        self._items = deque(maxlen=limit)

    def visit(self, page: str) -> None:
        self._items.append(page)

    def latest_first(self) -> list:
        return list(reversed(self._items))


def round_robin(players: list, turns: int) -> list:
    ring = deque(players)
    order = []
    for _ in range(turns):
        order.append(ring[0])
        ring.rotate(-1)
    return order


if __name__ == "__main__":
    history = RecentHistory(3)
    for p in ["home", "docs", "blog", "about", "contact"]:
        history.visit(p)
    print(history.latest_first())
    print(round_robin(["ann", "bo", "cy"], 7))
