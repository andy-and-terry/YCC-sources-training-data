# Bouncy numbers: digits are neither monotonically non-decreasing nor
# non-increasing. Count the bouncy numbers below 1000.
def is_bouncy(n):
    s = str(n)
    return s != "".join(sorted(s)) and s != "".join(sorted(s, reverse=True))

print(sum(is_bouncy(n) for n in range(1, 1000)))
