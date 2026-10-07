from typing import List


def dutch_national_flag(arr: List[int], pivot: int = 1) -> List[int]:
    """Three-way partition (0s, pivot-values, 2s) in a single pass, in place."""
    low, mid, high = 0, 0, len(arr) - 1
    while mid <= high:
        if arr[mid] < pivot:
            arr[low], arr[mid] = arr[mid], arr[low]
            low += 1
            mid += 1
        elif arr[mid] == pivot:
            mid += 1
        else:
            arr[mid], arr[high] = arr[high], arr[mid]
            high -= 1
    return arr


if __name__ == "__main__":
    print(dutch_national_flag([2, 0, 2, 1, 1, 0]))
    print(dutch_national_flag([2, 0, 1]))
