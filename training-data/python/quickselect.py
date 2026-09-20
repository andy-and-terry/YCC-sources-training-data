import random


def quickselect(items, k):
    """Return the k-th smallest element (0-indexed) in expected O(n) time."""
    items = list(items)

    def select(lo, hi, k):
        if lo == hi:
            return items[lo]
        pivot_index = random.randint(lo, hi)
        pivot_index = partition(lo, hi, pivot_index, k)
        if k == pivot_index:
            return items[k]
        elif k < pivot_index:
            return select(lo, pivot_index - 1, k)
        else:
            return select(pivot_index + 1, hi, k)

    def partition(lo, hi, pivot_index, k):
        pivot_value = items[pivot_index]
        items[pivot_index], items[hi] = items[hi], items[pivot_index]
        store_index = lo
        for i in range(lo, hi):
            if items[i] < pivot_value:
                items[store_index], items[i] = items[i], items[store_index]
                store_index += 1
        items[hi], items[store_index] = items[store_index], items[hi]
        return store_index

    return select(0, len(items) - 1, k)


if __name__ == "__main__":
    data = [7, 10, 4, 3, 20, 15]
    for k in range(len(data)):
        print(f"{k}-th smallest:", quickselect(data, k))
