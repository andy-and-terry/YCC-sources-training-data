type Tree =
    | Leaf
    | Node of Tree * int * int * Tree

let height tree =
    match tree with
    | Leaf -> 0
    | Node(_, _, h, _) -> h

let makeNode left value right =
    Node(left, value, 1 + max (height left) (height right), right)

let balanceFactor tree =
    match tree with
    | Leaf -> 0
    | Node(l, _, _, r) -> height l - height r

let rotateLeft tree =
    match tree with
    | Node(l, v, _, Node(rl, rv, _, rr)) -> makeNode (makeNode l v rl) rv rr
    | _ -> tree

let rotateRight tree =
    match tree with
    | Node(Node(ll, lv, _, lr), v, _, r) -> makeNode ll lv (makeNode lr v r)
    | _ -> tree

let balance tree =
    match tree with
    | Leaf -> Leaf
    | Node(l, v, _, r) ->
        let bf = balanceFactor tree
        if bf > 1 then
            if balanceFactor l < 0 then rotateRight (makeNode (rotateLeft l) v r)
            else rotateRight tree
        elif bf < -1 then
            if balanceFactor r > 0 then rotateLeft (makeNode l v (rotateRight r))
            else rotateLeft tree
        else tree

let rec insert value tree =
    match tree with
    | Leaf -> makeNode Leaf value Leaf
    | Node(l, v, _, r) ->
        if value < v then balance (makeNode (insert value l) v r)
        elif value > v then balance (makeNode l v (insert value r))
        else tree

let rec inorder tree =
    match tree with
    | Leaf -> []
    | Node(l, v, _, r) -> inorder l @ [ v ] @ inorder r

let tree = [ 10; 20; 30; 40; 50; 25; 5 ] |> List.fold (fun t x -> insert x t) Leaf
printfn "%A" (inorder tree)
