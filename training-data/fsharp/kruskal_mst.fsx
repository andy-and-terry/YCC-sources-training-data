let rec find (parents: Map<int, int>) x =
    match Map.find x parents with
    | p when p = x -> x
    | p -> find parents p

let union parents x y =
    let rootX = find parents x
    let rootY = find parents y
    if rootX = rootY then false, parents
    else true, Map.add rootX rootY parents

let kruskalMst numNodes (edges: (int * int * int) list) =
    let sorted = edges |> List.sortBy (fun (_, _, w) -> w)
    let mutable parents = [ 0 .. numNodes - 1 ] |> List.map (fun i -> i, i) |> Map.ofList
    let mutable total = 0
    for (a, b, w) in sorted do
        let added, newParents = union parents a b
        if added then
            parents <- newParents
            total <- total + w
    total

let edges = [ 0, 1, 4; 0, 2, 1; 2, 1, 2; 1, 3, 1; 2, 3, 5 ]
printfn "%d" (kruskalMst 4 edges)
