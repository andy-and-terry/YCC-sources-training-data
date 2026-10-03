let bellmanFord (edges: (int * int * int) list) (vertexCount: int) (source: int) =
    let inf = System.Int32.MaxValue / 2
    let dist = Array.create vertexCount inf
    dist.[source] <- 0

    for _ in 1 .. vertexCount - 1 do
        for (u, v, w) in edges do
            if dist.[u] <> inf && dist.[u] + w < dist.[v] then
                dist.[v] <- dist.[u] + w

    let hasNegativeCycle =
        edges
        |> List.exists (fun (u, v, w) -> dist.[u] <> inf && dist.[u] + w < dist.[v])

    dist, hasNegativeCycle

let edges =
    [ (0, 1, -1)
      (0, 2, 4)
      (1, 2, 3)
      (1, 3, 2)
      (1, 4, 2)
      (3, 2, 5)
      (3, 1, 1)
      (4, 3, -3) ]

let dist, hasNegCycle = bellmanFord edges 5 0
printfn "%A" dist
printfn "%b" hasNegCycle
