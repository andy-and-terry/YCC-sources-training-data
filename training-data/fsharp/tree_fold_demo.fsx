type Tree<'a> =
    | Leaf
    | Node of Tree<'a> * 'a * Tree<'a>

let rec insert x tree =
    match tree with
    | Leaf -> Node(Leaf, x, Leaf)
    | Node(l, v, r) when x < v -> Node(insert x l, v, r)
    | Node(l, v, r) when x > v -> Node(l, v, insert x r)
    | _ -> tree

let rec fold f acc tree =
    match tree with
    | Leaf -> acc
    | Node(l, v, r) ->
        let accLeft = fold f acc l
        let accMid = f accLeft v
        fold f accMid r

let rec depth tree =
    match tree with
    | Leaf -> 0
    | Node(l, _, r) -> 1 + max (depth l) (depth r)

let tree = [ 5; 3; 8; 1; 4; 7; 9 ] |> List.fold (fun t x -> insert x t) Leaf

printfn "in-order: %A" (fold (fun acc x -> acc @ [ x ]) [] tree)
printfn "sum: %d" (fold (+) 0 tree)
printfn "depth: %d" (depth tree)
