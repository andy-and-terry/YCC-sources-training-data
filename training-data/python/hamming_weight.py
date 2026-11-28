def popcount(n):
    count = 0
    while n:
        n &= n - 1  # clear lowest set bit
        count += 1
    return count

print(popcount(0b10110111))
print(popcount(255), popcount(0))
