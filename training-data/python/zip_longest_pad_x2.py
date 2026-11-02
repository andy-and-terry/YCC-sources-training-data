from itertools import zip_longest

print(list(zip_longest([1, 2, 3], "ab", fillvalue="-")))
