def comb_sort(a):
    a = list(a)
    gap = len(a)
    shrink = 1.3
    done = False
    while not done:
        gap = int(gap / shrink)
        if gap <= 1:
            gap = 1
            done = True
        for i in range(len(a) - gap):
            if a[i] > a[i + gap]:
                a[i], a[i + gap] = a[i + gap], a[i]
                done = False
    return a


if __name__ == "__main__":
    print(comb_sort([8, 4, 1, 56, 3, -44, 23, -6, 28, 0]))
