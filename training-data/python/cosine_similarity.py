import math

def cosine(a, b):
    dot = sum(x * y for x, y in zip(a, b))
    na = math.sqrt(sum(x * x for x in a))
    nb = math.sqrt(sum(y * y for y in b))
    return dot / (na * nb) if na and nb else 0.0

print(round(cosine([1, 2, 3], [4, 5, 6]), 4))
print(cosine([1, 0], [0, 1]))
