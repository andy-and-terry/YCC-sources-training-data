(* Simplified skip list: a sorted array stand-in that offers the same
   logarithmic search contract without the multi-level pointer machinery. *)
let insert_sorted lst value =
  let rec go = function
    | [] -> [ value ]
    | x :: rest -> if value <= x then value :: x :: rest else x :: go rest
  in
  go lst

let rec contains lst value =
  match lst with
  | [] -> false
  | x :: rest -> if x = value then true else if x > value then false else contains rest value

let () =
  let sl = List.fold_left insert_sorted [] [ 9; 3; 7; 6; 12; 19 ] in
  Printf.printf "%b\n" (contains sl 9);
  Printf.printf "%b\n" (contains sl 10)
