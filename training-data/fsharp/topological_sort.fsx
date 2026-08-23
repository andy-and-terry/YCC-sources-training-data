let topoSort (graph: Map<string, string list>) =
    let visited = System.Collections.Generic.HashSet<string>()
    let order = System.Collections.Generic.List<string>()

    let rec visit node =
        if not (visited.Contains node) then
            visited.Add node |> ignore
            match Map.tryFind node graph with
            | Some deps -> deps |> List.iter visit
            | None -> ()
            order.Add node

    graph |> Map.iter (fun k _ -> visit k)
    List.ofSeq order

let graph = Map.ofList [ "a", [ "b"; "c" ]; "b", [ "d" ]; "c", [ "d" ]; "d", [] ]
printfn "%A" (topoSort graph)
