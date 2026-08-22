class DisjointSet:
    def __init__(self, elements):
        self.parent = {e: e for e in elements}
        self.size = {e: 1 for e in elements}

    def find(self, x):
        while self.parent[x] != x:
            self.parent[x] = self.parent[self.parent[x]]
            x = self.parent[x]
        return x

    def union(self, a, b):
        ra, rb = self.find(a), self.find(b)
        if ra == rb:
            return
        if self.size[ra] < self.size[rb]:
            ra, rb = rb, ra
        self.parent[rb] = ra
        self.size[ra] += self.size[rb]

    def connected(self, a, b):
        return self.find(a) == self.find(b)


if __name__ == "__main__":
    ds = DisjointSet(["a", "b", "c", "d"])
    ds.union("a", "b")
    ds.union("b", "c")
    print(ds.connected("a", "c"), ds.connected("a", "d"))
