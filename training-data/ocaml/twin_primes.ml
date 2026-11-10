let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n >= 2 && go 2

let () =
  for p = 3 to 78 do
    if is_prime p && is_prime (p + 2) then Printf.printf "(%d,%d) " p (p + 2)
  done;
  print_newline ()
  (* (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73) *)
