def partition3(a, pivot):
    """Rearranges a in place into < pivot, == pivot, > pivot."""
    lo, mid, hi = 0, 0, len(a) - 1
    while mid <= hi:
        if a[mid] < pivot:
            a[lo], a[mid] = a[mid], a[lo]
            lo += 1
            mid += 1
        elif a[mid] > pivot:
            a[mid], a[hi] = a[hi], a[mid]
            hi -= 1
        else:
            mid += 1
    return lo, hi


if __name__ == "__main__":
    colors = [2, 0, 2, 1, 1, 0, 1, 2, 0]
    print(partition3(colors, 1), colors)
