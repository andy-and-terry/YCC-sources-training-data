import random
from collections import Counter

random.seed(7)
items = ["red", "green", "blue"]
weights = [6, 3, 1]
picks = random.choices(items, weights=weights, k=1000)
print(Counter(picks))
