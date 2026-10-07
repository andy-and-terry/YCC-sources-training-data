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
let to_list t = List.rev (fold (fun acc v -> v :: acc) [] t)

let rec height = function
  | Leaf -> 0
  | Node (l, _, r) -> 1 + max (height l) (height r)

let () =
  let t = List.fold_left (fun t x -> insert x t) Leaf [ 5; 3; 8; 1; 4; 7; 9; 3 ] in
  Printf.printf "size=%d height=%d\n" (size t) (height t);
  to_list t |> List.map string_of_int |> String.concat " " |> print_endline;
  Printf.printf "sum=%d\n" (fold ( + ) 0 t)
