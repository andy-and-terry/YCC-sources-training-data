# Perrin sequence P(n)=P(n-2)+P(n-3)
def sequence(count: int) -> list[int]:
    v = [3, 0, 2]
    while len(v) < count:
        v.append(v[-2] + v[-3])
    return v[:count]


print(*sequence(10))
