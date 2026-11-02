import heapq

words = ["pear", "fig", "banana", "kiwi", "apple"]
print(heapq.nlargest(2, words, key=len))
