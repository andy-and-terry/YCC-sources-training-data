type Node =
    { Value: int
      mutable Next: Node option }

let makeCyclicList values cycleBackTo =
    let nodes = values |> List.map (fun v -> { Value = v; Next = None })
    let arr = List.toArray nodes
    for i in 0 .. arr.Length - 2 do
        arr.[i].Next <- Some arr.[i + 1]
    match cycleBackTo with
    | Some idx -> arr.[arr.Length - 1].Next <- Some arr.[idx]
    | None -> ()
    arr.[0]

let hasCycle (head: Node) =
    let rec go slow fast =
        match fast with
        | None -> false
        | Some (f: Node) ->
            match f.Next with
            | None -> false
            | Some fastNext ->
                let slowNext = (Option.get slow: Node).Next
                if System.Object.ReferenceEquals(slowNext, fastNext) then true
                else go slowNext fastNext.Next
    match head.Next with
    | None -> false
    | Some _ -> go (Some head) (Some head)

let acyclic = makeCyclicList [ 1; 2; 3; 4 ] None
let cyclic = makeCyclicList [ 1; 2; 3; 4 ] (Some 1)

printfn "%b" (hasCycle acyclic)
printfn "%b" (hasCycle cyclic)
