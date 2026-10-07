def odd_even_sort(a):
    a = list(a)
    sorted_ = False
    while not sorted_:
        sorted_ = True
        for start in (1, 0):
            for i in range(start, len(a) - 1, 2):
                if a[i] > a[i + 1]:
                    a[i], a[i + 1] = a[i + 1], a[i]
                    sorted_ = False
    return a


if __name__ == "__main__":
    print(odd_even_sort([34, 2, 10, -9, 5, 3, 1]))
