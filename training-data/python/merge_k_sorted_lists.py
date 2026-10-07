import heapq
from typing import Iterable, Iterator


def merge_k(lists: Iterable[list[int]]) -> Iterator[int]:
    lists = list(lists)
    heap = [(lst[0], i, 0) for i, lst in enumerate(lists) if lst]
    heapq.heapify(heap)
    while heap:
        value, i, j = heapq.heappop(heap)
        yield value
        if j + 1 < len(lists[i]):
            heapq.heappush(heap, (lists[i][j + 1], i, j + 1))


if __name__ == "__main__":
    data = [[1, 4, 7], [2, 5, 8], [0, 3, 6, 9], []]
    print(list(merge_k(data)))
    print(list(heapq.merge(*data)))
