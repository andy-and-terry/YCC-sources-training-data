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

let () =
  let t = List.fold_left (fun t x -> insert x t) Leaf [ 5; 3; 8; 1; 4; 9 ] in
  Printf.printf "sum = %d\n" (fold ( + ) 0 t);
  Printf.printf "sorted = %s\n"
    (String.concat " " (List.rev (fold (fun acc x -> string_of_int x :: acc) [] t)))
