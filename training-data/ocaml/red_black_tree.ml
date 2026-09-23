type color = Red | Black
type 'a rbtree = Leaf | Node of color * 'a rbtree * 'a * 'a rbtree

let balance = function
  | Black, Node (Red, Node (Red, a, x, b), y, c), z, d
  | Black, Node (Red, a, x, Node (Red, b, y, c)), z, d
  | Black, a, x, Node (Red, Node (Red, b, y, c), z, d)
  | Black, a, x, Node (Red, b, y, Node (Red, c, z, d)) ->
      Node (Red, Node (Black, a, x, b), y, Node (Black, c, z, d))
  | color, a, x, b -> Node (color, a, x, b)

let insert value tree =
  let rec ins = function
    | Leaf -> Node (Red, Leaf, value, Leaf)
    | Node (color, l, v, r) as node ->
        if value < v then balance (color, ins l, v, r)
        else if value > v then balance (color, l, v, ins r)
        else node
  in
  match ins tree with
  | Node (_, l, v, r) -> Node (Black, l, v, r)
  | Leaf -> Leaf

let rec inorder = function
  | Leaf -> []
  | Node (_, l, v, r) -> inorder l @ [ v ] @ inorder r

let () =
  let tree = List.fold_left (fun t x -> insert x t) Leaf [ 10; 18; 7; 15; 16; 30; 25; 40; 60 ] in
  inorder tree |> List.map string_of_int |> String.concat " " |> print_endline
