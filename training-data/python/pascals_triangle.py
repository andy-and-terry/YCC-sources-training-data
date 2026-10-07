def pascal(rows):
    row = [1]
    for _ in range(rows):
        yield row
        row = [a + b for a, b in zip([0] + row, row + [0])]


for r in pascal(6):
    print(" ".join(map(str, r)).center(20))
