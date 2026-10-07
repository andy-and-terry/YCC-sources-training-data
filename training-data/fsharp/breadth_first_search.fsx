let graph =
    dict [ 1, [ 2; 3 ]
           2, [ 4 ]
           3, [ 4 ]
           4, [ 5 ]
           5, [] ]

let bfs (start: int) =
    let visited = System.Collections.Generic.HashSet<int>()
    let queue = System.Collections.Generic.Queue<int>()
    let order = ResizeArray<int>()

    visited.Add(start) |> ignore
    queue.Enqueue(start)

    while queue.Count > 0 do
        let node = queue.Dequeue()
        order.Add(node)
        for neighbor in graph.[node] do
            if not (visited.Contains neighbor) then
                visited.Add(neighbor) |> ignore
                queue.Enqueue(neighbor)

    List.ofSeq order

printfn "%A" (bfs 1)
