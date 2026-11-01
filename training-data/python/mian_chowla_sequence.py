# Mian-Chowla: greedily pick the smallest next term so that all pairwise
# sums (including a+a) stay distinct.
def mian_chowla(count):
    seq, sums = [], set()
    cand = 1
    while len(seq) < count:
        new = {cand + x for x in seq} | {2 * cand}
        if not (new & sums) and len({cand + x for x in seq}) == len(seq):
            seq.append(cand)
            sums |= new
        cand += 1
    return seq

print(*mian_chowla(8))
