def schedule(jobs):
    """jobs: list of (name, deadline, profit); each job takes one slot."""
    jobs = sorted(jobs, key=lambda j: -j[2])
    max_d = max(j[1] for j in jobs)
    parent = list(range(max_d + 1))

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    slots = [None] * (max_d + 1)
    for name, deadline, profit in jobs:
        free = find(deadline)
        if free > 0:
            slots[free] = name
            parent[free] = free - 1
    chosen = [s for s in slots if s]
    profit = sum(p for n, _, p in jobs if n in chosen)
    return chosen, profit


if __name__ == "__main__":
    print(schedule([("a", 2, 100), ("b", 1, 19), ("c", 2, 27), ("d", 1, 25), ("e", 3, 15)]))
