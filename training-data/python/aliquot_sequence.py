# Aliquot sequence: repeatedly replace n by the sum of its proper divisors.
def aliquot_sum(n):
    return sum(d for d in range(1, n // 2 + 1) if n % d == 0)

def aliquot(n, limit=20):
    seq = [n]
    while seq[-1] > 1 and len(seq) < limit:
        seq.append(aliquot_sum(seq[-1]))
    return seq

print(*aliquot(12))
