import heapq

# heapq utilities: k smallest/largest and merging already-sorted streams.
def top_k_smallest(values, k):
    return heapq.nsmallest(k, values)

def merge_sorted(*streams):
    return list(heapq.merge(*streams))

if __name__ == "__main__":
    data = [9, 4, 7, 1, 8, 2]
    print(top_k_smallest(data, 3), heapq.nlargest(2, data))
    print(merge_sorted([1, 4, 9], [2, 3, 10], [5, 6]))
