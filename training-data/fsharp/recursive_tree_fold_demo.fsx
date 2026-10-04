type Tree<'T> =
    | Leaf
    | Node of Tree<'T> * 'T * Tree<'T>

let rec insert value tree =
    match tree with
    | Leaf -> Node(Leaf, value, Leaf)
    | Node(l, v, r) when value < v -> Node(insert value l, v, r)
    | Node(l, v, r) when value > v -> Node(l, v, insert value r)
    | _ -> tree

let rec fold f acc tree =
    match tree with
    | Leaf -> acc
    | Node(l, v, r) -> fold f (f (fold f acc l) v) r

let rec height tree =
    match tree with
    | Leaf -> 0
    | Node(l, _, r) -> 1 + max (height l) (height r)

let tree = [ 5; 3; 8; 1; 4; 7; 9; 3 ] |> List.fold (fun t v -> insert v t) Leaf

fold (fun acc v -> acc @ [ v ]) [] tree |> printfn "in-order: %A"
fold (+) 0 tree |> printfn "sum: %d"
fold (fun n _ -> n + 1) 0 tree |> printfn "count: %d"
printfn "height: %d" (height tree)
