from typing import List


def binary_search(items: List[int], target: int) -> int:
    low, high = 0, len(items) - 1
    while low <= high:
        mid = (low + high) // 2
        if items[mid] == target:
            return mid
        if items[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1


def lower_bound(items: List[int], target: int) -> int:
    low, high = 0, len(items)
    while low < high:
        mid = (low + high) // 2
        if items[mid] < target:
            low = mid + 1
        else:
            high = mid
    return low


def upper_bound(items: List[int], target: int) -> int:
    low, high = 0, len(items)
    while low < high:
        mid = (low + high) // 2
        if items[mid] <= target:
            low = mid + 1
        else:
            high = mid
    return low


if __name__ == "__main__":
    data = [1, 2, 2, 2, 3, 5, 8]
    print(binary_search(data, 5))
    print(lower_bound(data, 2), upper_bound(data, 2))
