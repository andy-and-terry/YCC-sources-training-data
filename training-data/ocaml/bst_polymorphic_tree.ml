type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

let rec insert x = function
  | Leaf -> Node (Leaf, x, Leaf)
  | Node (l, v, r) as t -> if x < v then Node (insert x l, v, r) else if x > v then Node (l, v, insert x r) else t

let rec to_list = function Leaf -> [] | Node (l, v, r) -> to_list l @ [ v ] @ to_list r

let rec height = function Leaf -> 0 | Node (l, _, r) -> 1 + max (height l) (height r)

let rec mem x = function Leaf -> false | Node (l, v, r) -> x = v || if x < v then mem x l else mem x r

let () =
  let t = List.fold_left (fun t x -> insert x t) Leaf [ 5; 3; 8; 1; 4; 7; 9; 3 ] in
  print_endline (String.concat " " (List.map string_of_int (to_list t)));
  Printf.printf "%d %b %b\n" (height t) (mem 4 t) (mem 6 t);
  let ts = List.fold_left (fun t s -> insert s t) Leaf [ "pear"; "apple"; "fig" ] in
  print_endline (String.concat "," (to_list ts))
