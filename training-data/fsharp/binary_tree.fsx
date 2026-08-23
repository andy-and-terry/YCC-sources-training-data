type Tree =
    | Leaf
    | Node of Tree * int * Tree

let rec insert value tree =
    match tree with
    | Leaf -> Node(Leaf, value, Leaf)
    | Node(l, v, r) when value < v -> Node(insert value l, v, r)
    | Node(l, v, r) when value > v -> Node(l, v, insert value r)
    | _ -> tree

let rec inorder tree =
    match tree with
    | Leaf -> []
    | Node(l, v, r) -> inorder l @ [ v ] @ inorder r

let tree = [ 5; 3; 8; 1; 4; 7; 9 ] |> List.fold (fun t x -> insert x t) Leaf
printfn "%A" (inorder tree)
