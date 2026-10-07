let sum = List.fold_left ( + ) 0
let product = List.fold_left ( * ) 1

let max_of = function
  | [] -> None
  | x :: xs -> Some (List.fold_left max x xs)

(* fold_right keeps the original order when rebuilding a list *)
let map_via_fold f xs = List.fold_right (fun x acc -> f x :: acc) xs []

let () =
  let xs = [ 3; 1; 4; 1; 5; 9; 2; 6 ] in
  Printf.printf "sum=%d product=%d\n" (sum xs) (product xs);
  (match max_of xs with
   | Some m -> Printf.printf "max=%d\n" m
   | None -> print_endline "empty");
  map_via_fold (fun x -> x * x) [ 1; 2; 3 ]
  |> List.map string_of_int |> String.concat "," |> print_endline
