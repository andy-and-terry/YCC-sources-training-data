# Cyclops numbers: odd digit count, middle digit zero, no other zeros.
# Count those in 1..99999 (expected 81 + 6561 = 6642).
def is_cyclops(n):
    s = str(n)
    mid = len(s) // 2
    return len(s) % 2 == 1 and s[mid] == "0" and s.count("0") == 1

print(sum(is_cyclops(n) for n in range(1, 100000)))
