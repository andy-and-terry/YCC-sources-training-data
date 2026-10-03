let primsMst (graph: Map<int, (int * int) list>) numNodes =
    let visited = System.Collections.Generic.HashSet<int>()
    visited.Add 0 |> ignore
    let mutable total = 0

    while visited.Count < numNodes do
        let candidates =
            [ for node in visited do
                for (neighbor, weight) in Map.find node graph do
                    if not (visited.Contains neighbor) then
                        yield neighbor, weight ]
        let best = candidates |> List.sortBy snd |> List.head
        visited.Add(fst best) |> ignore
        total <- total + snd best

    total

let graph =
    Map.ofList
        [ 0, [ 1, 4; 2, 1 ]
          1, [ 0, 4; 2, 2; 3, 1 ]
          2, [ 0, 1; 1, 2; 3, 5 ]
          3, [ 1, 1; 2, 5 ] ]

printfn "%d" (primsMst graph 4)
