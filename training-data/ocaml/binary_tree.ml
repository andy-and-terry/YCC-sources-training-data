type tree = Leaf | Node of tree * int * tree

let rec insert value = function
  | Leaf -> Node (Leaf, value, Leaf)
  | Node (l, v, r) when value < v -> Node (insert value l, v, r)
  | Node (l, v, r) when value > v -> Node (l, v, insert value r)
  | t -> t

let rec inorder = function
  | Leaf -> []
  | Node (l, v, r) -> inorder l @ [ v ] @ inorder r

let () =
  let tree = List.fold_left (fun t x -> insert x t) Leaf [ 5; 3; 8; 1; 4; 7; 9 ] in
  inorder tree |> List.map string_of_int |> String.concat " " |> print_endline
