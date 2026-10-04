import heapq


def merge_k_sorted(lists):
    """Merge k sorted lists using a min-heap of (value, list_index, position)."""
    heap = [(lst[0], i, 0) for i, lst in enumerate(lists) if lst]
    heapq.heapify(heap)
    result = []
    while heap:
        value, i, pos = heapq.heappop(heap)
        result.append(value)
        if pos + 1 < len(lists[i]):
            heapq.heappush(heap, (lists[i][pos + 1], i, pos + 1))
    return result


if __name__ == "__main__":
    data = [[1, 4, 9], [2, 3, 10], [], [0, 5, 6, 12]]
    print(merge_k_sorted(data))
    print(list(heapq.merge(*data)))
