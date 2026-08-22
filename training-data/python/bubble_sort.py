def bubble_sort(items):
    items = items[:]
    n = len(items)
    for i in range(n):
        swapped = False
        for j in range(n - i - 1):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
                swapped = True
        if not swapped:
            break
    return items


if __name__ == "__main__":
    print(bubble_sort([5, 3, 8, 1, 9, 2]))
