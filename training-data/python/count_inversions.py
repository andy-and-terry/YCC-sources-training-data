def count_inversions(arr):
    """Return (sorted_list, inversion_count) via merge sort, O(n log n)."""
    if len(arr) <= 1:
        return arr, 0
    mid = len(arr) // 2
    left, a = count_inversions(arr[:mid])
    right, b = count_inversions(arr[mid:])
    merged, cross = [], 0
    i = j = 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            merged.append(left[i])
            i += 1
        else:
            merged.append(right[j])
            cross += len(left) - i
            j += 1
    merged += left[i:] + right[j:]
    return merged, a + b + cross


print(count_inversions([2, 4, 1, 3, 5])[1])  # 3
print(count_inversions([5, 4, 3, 2, 1])[1])  # 10
