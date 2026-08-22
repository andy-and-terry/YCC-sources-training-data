def insertion_sort(items):
    items = items[:]
    for i in range(1, len(items)):
        key = items[i]
        j = i - 1
        while j >= 0 and items[j] > key:
            items[j + 1] = items[j]
            j -= 1
        items[j + 1] = key
    return items


if __name__ == "__main__":
    print(insertion_sort([5, 3, 8, 1, 9, 2]))
