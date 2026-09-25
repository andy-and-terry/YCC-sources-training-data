import heapq


def merge_two(a, b):
    i = j = 0
    out = []
    while i < len(a) and j < len(b):
        if a[i] <= b[j]:
            out.append(a[i]); i += 1
        else:
            out.append(b[j]); j += 1
    return out + a[i:] + b[j:]


def merge_k(arrays):
    heap = [(arr[0], idx, 0) for idx, arr in enumerate(arrays) if arr]
    heapq.heapify(heap)
    out = []
    while heap:
        val, idx, pos = heapq.heappop(heap)
        out.append(val)
        if pos + 1 < len(arrays[idx]):
            heapq.heappush(heap, (arrays[idx][pos + 1], idx, pos + 1))
    return out


if __name__ == "__main__":
    print(merge_two([1, 4, 7], [2, 3, 8, 9]))
    print(merge_k([[1, 5, 9], [2, 6], [0, 3, 4, 10]]))
