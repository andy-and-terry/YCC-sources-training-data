def shell_sort(items):
    items = items[:]
    n = len(items)
    gap = n // 2
    while gap > 0:
        for i in range(gap, n):
            temp = items[i]
            j = i
            while j >= gap and items[j - gap] > temp:
                items[j] = items[j - gap]
                j -= gap
            items[j] = temp
        gap //= 2
    return items


if __name__ == "__main__":
    print(shell_sort([5, 3, 8, 1, 9, 2]))
