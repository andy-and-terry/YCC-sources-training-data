# Bead (gravity) sort: beads fall down rods, then rows are read back.
def bead_sort(nums):
    columns = [0] * max(nums)
    for n in nums:
        for i in range(n):
            columns[i] += 1
    rows = [sum(1 for c in columns if c > r) for r in range(len(nums))]
    return rows[::-1]

print(bead_sort([5, 3, 1, 4, 2]))
