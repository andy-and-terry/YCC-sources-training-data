type Tree<'a> =
    | Leaf
    | Node of Tree<'a> * 'a * Tree<'a>

let rec insert x = function
    | Leaf -> Node(Leaf, x, Leaf)
    | Node(l, v, r) when x < v -> Node(insert x l, v, r)
    | Node(l, v, r) -> Node(l, v, insert x r)

let rec toList = function
    | Leaf -> []
    | Node(l, v, r) -> toList l @ [ v ] @ toList r

printfn "%A" ([ 5; 2; 8; 1 ] |> List.fold (fun t x -> insert x t) Leaf |> toList)
