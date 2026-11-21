# Keith numbers: seed a Fibonacci-like sequence with the digits of n; n is
# Keith if it appears in the sequence.
def is_keith(n):
    seq = [int(c) for c in str(n)]
    k = len(seq)
    while seq[-1] < n:
        seq.append(sum(seq[-k:]))
    return seq[-1] == n

print(*[n for n in range(10, 1200) if is_keith(n)])
