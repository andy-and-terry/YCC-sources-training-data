let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n >= 2 && go 2

let () =
  let rec collect p left acc =
    if left = 0 then List.rev acc
    else if is_prime p && is_prime (2 * p + 1) then collect (p + 1) (left - 1) (p :: acc)
    else collect (p + 1) left acc
  in
  print_endline (String.concat " " (List.map string_of_int (collect 2 10 [])))
  (* 2 3 5 11 23 29 41 53 83 89 *)
