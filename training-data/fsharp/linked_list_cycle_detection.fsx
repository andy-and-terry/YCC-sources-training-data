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
    let rec advance node steps =
        match steps, node with
        | 0, n -> n
        | _, None -> None
        | s, Some(n: Node) -> advance n.Next (s - 1)

    let rec loop slow fast =
        match fast with
        | None -> false
        | Some(f: Node) ->
            match f.Next with
            | None -> false
            | Some _ ->
                let nextSlow = advance slow 1
                let nextFast = advance fast 2
                match nextSlow, nextFast with
                | Some s, Some f when System.Object.ReferenceEquals(s, f) -> true
                | Some _, Some _ -> loop nextSlow nextFast
                | _ -> false

    loop (Some head) (Some head)

let acyclic = makeCyclicList [ 1; 2; 3; 4 ] None
let cyclic = makeCyclicList [ 1; 2; 3; 4 ] (Some 1)

printfn "%b" (hasCycle acyclic)
printfn "%b" (hasCycle cyclic)
