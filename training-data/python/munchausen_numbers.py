# Munchausen numbers: equal to the sum of each digit raised to itself
# (with 0**0 taken as 0).
def is_munchausen(n):
    return sum(int(c) ** int(c) if c != "0" else 0 for c in str(n)) == n

print(*[n for n in range(1, 5000) if is_munchausen(n)])
