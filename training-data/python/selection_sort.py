def selection_sort(items):
    items = items[:]
    n = len(items)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if items[j] < items[min_idx]:
                min_idx = j
        items[i], items[min_idx] = items[min_idx], items[i]
    return items


if __name__ == "__main__":
    print(selection_sort([5, 3, 8, 1, 9, 2]))
