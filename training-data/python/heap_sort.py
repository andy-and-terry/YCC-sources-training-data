import heapq


def heap_sort(items):
    heap = items[:]
    heapq.heapify(heap)
    return [heapq.heappop(heap) for _ in range(len(heap))]


def heap_sort_manual(items):
    def sift_down(arr, start, end):
        root = start
        while 2 * root + 1 <= end:
            child = 2 * root + 1
            if child + 1 <= end and arr[child] < arr[child + 1]:
                child += 1
            if arr[root] < arr[child]:
                arr[root], arr[child] = arr[child], arr[root]
                root = child
            else:
                return

    arr = items[:]
    n = len(arr)
    for start in range(n // 2 - 1, -1, -1):
        sift_down(arr, start, n - 1)
    for end in range(n - 1, 0, -1):
        arr[0], arr[end] = arr[end], arr[0]
        sift_down(arr, 0, end - 1)
    return arr


if __name__ == "__main__":
    print(heap_sort([5, 3, 8, 1, 9, 2]))
    print(heap_sort_manual([5, 3, 8, 1, 9, 2]))
