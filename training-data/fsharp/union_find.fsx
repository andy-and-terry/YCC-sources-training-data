type UnionFind(n: int) =
    let parent = Array.init n id

    member this.Find(x: int) : int =
        if parent.[x] = x then x
        else this.Find(parent.[x])

    member this.Union(x: int, y: int) =
        let rootX = this.Find(x)
        let rootY = this.Find(y)
        if rootX <> rootY then parent.[rootX] <- rootY

let uf = UnionFind(5)
uf.Union(0, 1)
uf.Union(1, 2)
printfn "%b" (uf.Find(0) = uf.Find(2))
printfn "%b" (uf.Find(0) = uf.Find(3))
