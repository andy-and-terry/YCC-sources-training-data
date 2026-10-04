"""heapq helpers: merge, nlargest, nsmallest, and a heap-based top-k."""
import heapq


def main():
    a = [1, 4, 9]
    b = [2, 3, 10]
    c = [0, 5, 6]
    print(list(heapq.merge(a, b, c)))
    scores = {"ann": 88, "bob": 95, "cy": 70, "di": 91}
    print(heapq.nlargest(2, scores, key=scores.get))
    print(heapq.nsmallest(2, scores.items(), key=lambda kv: kv[1]))
    h = []
    for task in [(3, "write"), (1, "plan"), (2, "code")]:
        heapq.heappush(h, task)
    while h:
        print(heapq.heappop(h))
    nums = [5, 7, 9, 1, 3]
    heapq.heapify(nums)
    print(heapq.heapreplace(nums, 4), nums[0])


if __name__ == "__main__":
    main()
