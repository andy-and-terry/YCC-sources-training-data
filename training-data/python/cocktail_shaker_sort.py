def cocktail_shaker_sort(a):
    a = list(a)
    lo, hi = 0, len(a) - 1
    swapped = True
    while swapped:
        swapped = False
        for i in range(lo, hi):
            if a[i] > a[i + 1]:
                a[i], a[i + 1] = a[i + 1], a[i]
                swapped = True
        hi -= 1
        for i in range(hi, lo, -1):
            if a[i - 1] > a[i]:
                a[i - 1], a[i] = a[i], a[i - 1]
                swapped = True
        lo += 1
    return a


if __name__ == "__main__":
    print(cocktail_shaker_sort([5, 1, 4, 2, 8, 0, 2]))
