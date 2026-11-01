import heapq

a = [1, 4, 9]
b = [2, 3, 10]
c = [0, 5, 6]
print(list(heapq.merge(a, b, c)))
print(list(heapq.merge(["a", "bb"], ["ccc"], key=len)))
print(heapq.nsmallest(3, [7, 2, 9, 1, 5]))
