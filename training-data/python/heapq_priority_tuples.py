import heapq
import itertools

tasks = []
counter = itertools.count()
for pri, name in [(2, "write"), (1, "plan"), (2, "test"), (3, "ship"), (1, "design")]:
    heapq.heappush(tasks, (pri, next(counter), name))

while tasks:
    pri, _, name = heapq.heappop(tasks)
    print(pri, name)

# max-heap by negating
h = [-x for x in [5, 1, 8, 3]]
heapq.heapify(h)
print(-heapq.heappop(h))

print(heapq.nsmallest(2, [5, 1, 8, 3]), heapq.nlargest(2, ["aa", "b", "cccc"], key=len))
print(heapq.heappushpop([2, 4], 1), heapq.heapreplace([2, 4], 9))
