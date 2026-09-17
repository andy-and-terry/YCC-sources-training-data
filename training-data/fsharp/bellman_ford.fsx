let bellmanFord (n: int) (edges: (int * int * int) list) (source: int) =
    let dist = Array.create n System.Int32.MaxValue
    dist.[source] <- 0

    for _ in 1 .. n - 1 do
        for (u, v, w) in edges do
            if dist.[u] <> System.Int32.MaxValue && dist.[u] + w < dist.[v] then
                dist.[v] <- dist.[u] + w

    let mutable hasNegativeCycle = false
    for (u, v, w) in edges do
        if dist.[u] <> System.Int32.MaxValue && dist.[u] + w < dist.[v] then
            hasNegativeCycle <- true

    dist, hasNegativeCycle

let edges = [ (0, 1, -1); (0, 2, 4); (1, 2, 3); (1, 3, 2); (1, 4, 2); (3, 2, 5); (3, 1, 1); (4, 3, -3) ]
let dist, hasNegativeCycle = bellmanFord 5 edges 0
printfn "%A" dist
printfn "%b" hasNegativeCycle
