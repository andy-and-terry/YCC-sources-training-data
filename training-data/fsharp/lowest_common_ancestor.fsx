type Tree =
    | Leaf
    | Node of int * Tree * Tree

let rec lca tree p q =
    match tree with
    | Leaf -> None
    | Node(value, _, _) when value = p || value = q -> Some value
    | Node(_, left, right) ->
        match lca left p q, lca right p q with
        | Some _, Some _ -> Some -1
        | Some l, None -> Some l
        | None, Some r -> Some r
        | None, None -> None

let tree =
    Node(6, Node(2, Node(0, Leaf, Leaf), Node(4, Leaf, Leaf)), Node(8, Leaf, Leaf))

printfn "%A" (lca tree 0 4)
