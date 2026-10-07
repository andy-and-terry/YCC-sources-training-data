from typing import List


def build_suffix_array(s: str) -> List[int]:
    """O(n log^2 n) doubling construction: sort suffixes by rank pairs."""
    n = len(s)
    rank = [ord(c) for c in s]
    suffix_indices = list(range(n))
    k = 1
    while True:
        def key(i: int):
            second = rank[i + k] if i + k < n else -1
            return (rank[i], second)

        suffix_indices.sort(key=key)
        new_rank = [0] * n
        new_rank[suffix_indices[0]] = 0
        for i in range(1, n):
            prev, curr = suffix_indices[i - 1], suffix_indices[i]
            new_rank[curr] = new_rank[prev] + (1 if key(prev) != key(curr) else 0)
        rank = new_rank
        if rank[suffix_indices[-1]] == n - 1:
            break
        k *= 2
    return suffix_indices


if __name__ == "__main__":
    text = "banana"
    sa = build_suffix_array(text)
    print(sa)
    print([text[i:] for i in sa])
