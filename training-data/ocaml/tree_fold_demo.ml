type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

let rec insert x = function
  | Leaf -> Node (Leaf, x, Leaf)
  | Node (l, v, r) as t ->
      if x < v then Node (insert x l, v, r)
      else if x > v then Node (l, v, insert x r)
      else t

let rec fold f acc = function
  | Leaf -> acc
  | Node (l, v, r) -> fold f (f (fold f acc l) v) r

let size t = fold (fun n _ -> n + 1) 0 t
let sum t = fold ( + ) 0 t
let to_list t = List.rev (fold (fun acc v -> v :: acc) [] t)
let rec height = function Leaf -> 0 | Node (l, _, r) -> 1 + max (height l) (height r)

let () =
  let t = List.fold_left (fun t x -> insert x t) Leaf [ 5; 2; 8; 1; 9; 3; 5 ] in
  Printf.printf "size=%d sum=%d height=%d\n" (size t) (sum t) (height t);
  print_endline (String.concat " " (List.map string_of_int (to_list t)));
  Printf.printf "max=%d\n" (fold max min_int t)
