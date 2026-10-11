type Tree<'a> =
    | Leaf
    | Node of Tree<'a> * 'a * Tree<'a>

let rec insert x = function
    | Leaf -> Node(Leaf, x, Leaf)
    | Node (l, v, r) when x < v -> Node(insert x l, v, r)
    | Node (l, v, r) when x > v -> Node(l, v, insert x r)
    | t -> t

let rec depth = function
    | Leaf -> 0
    | Node (l, _, r) -> 1 + max (depth l) (depth r)

let rec mapTree f = function
    | Leaf -> Leaf
    | Node (l, v, r) -> Node(mapTree f l, f v, mapTree f r)

let rec toList = function
    | Leaf -> []
    | Node (l, v, r) -> toList l @ [ v ] @ toList r

let t = [ 5; 2; 8; 1; 9; 3 ] |> List.fold (fun t x -> insert x t) Leaf
printfn "depth %d" (depth t)
printfn "%A" (toList t)
printfn "%A" (t |> mapTree (fun x -> x * 10) |> toList)
