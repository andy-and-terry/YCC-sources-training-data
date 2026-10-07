def gnome_sort(a):
    a = list(a)
    i = 0
    while i < len(a):
        if i == 0 or a[i - 1] <= a[i]:
            i += 1
        else:
            a[i - 1], a[i] = a[i], a[i - 1]
            i -= 1
    return a


if __name__ == "__main__":
    print(gnome_sort([34, 2, 10, -9, 7]))
