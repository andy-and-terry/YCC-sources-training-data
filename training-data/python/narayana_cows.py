# Narayana's cows N(n)=N(n-1)+N(n-3)
def sequence(count: int) -> list[int]:
    v = [1, 1, 1]
    while len(v) < count:
        v.append(v[-1] + v[-3])
    return v[:count]


print(*sequence(10))
