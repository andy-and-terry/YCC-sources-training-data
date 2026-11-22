# Euler zigzag (up/down) numbers via the Seidel-Entringer boustrophedon.
row = [1]
out = [1]
for _ in range(9):
    new = [0]
    for x in reversed(row):
        new.append(new[-1] + x)
    row = new
    out.append(row[-1])
print(*out)
