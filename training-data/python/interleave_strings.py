from itertools import zip_longest


def interleave(*parts):
    return "".join(c for group in zip_longest(*parts, fillvalue="") for c in group)


print(interleave("abc", "12345"))  # a1b2c345
print(interleave("ab", "cd", "efg"))  # acebdfg
