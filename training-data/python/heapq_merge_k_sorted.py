import heapq


def merge_k_sorted(lists):
    """Manual k-way merge using a min-heap of (value, list_idx, pos)."""
    heap = [(lst[0], i, 0) for i, lst in enumerate(lists) if lst]
    heapq.heapify(heap)
    out = []
    while heap:
        val, i, pos = heapq.heappop(heap)
        out.append(val)
        if pos + 1 < len(lists[i]):
            heapq.heappush(heap, (lists[i][pos + 1], i, pos + 1))
    return out


data = [[1, 4, 7], [2, 5, 8], [0, 3, 6, 9]]
print(merge_k_sorted(data))
print(list(heapq.merge(*data)))
print(heapq.nlargest(3, [5, 1, 9, 3, 7]))
