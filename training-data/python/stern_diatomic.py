def stern(count):
    seq = [0, 1]
    while len(seq) < count:
        i = len(seq)
        seq.append(seq[i // 2] if i % 2 == 0 else seq[i // 2] + seq[i // 2 + 1])
    return seq[:count]


print(stern(15))  # [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
