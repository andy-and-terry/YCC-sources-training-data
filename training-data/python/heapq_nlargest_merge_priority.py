import heapq

nums = [5, 1, 9, 3, 7]
print(heapq.nlargest(2, nums), heapq.nsmallest(2, nums))
print(list(heapq.merge([1, 4, 7], [2, 5, 8])))
h = []
for pri, task in [(2, "write"), (1, "plan"), (3, "ship")]:
    heapq.heappush(h, (pri, task))
while h:
    print(heapq.heappop(h))
