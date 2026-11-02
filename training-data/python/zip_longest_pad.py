from itertools import zip_longest

a = [1, 2, 3]
b = ["x", "y"]
print(list(zip_longest(a, b, fillvalue="-")))
