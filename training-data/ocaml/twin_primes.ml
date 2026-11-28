let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n > 1 && go 2

let () =
  for p = 3 to 48 do
    if is_prime p && is_prime (p + 2) then Printf.printf "(%d, %d) " p (p + 2)
  done;
  print_newline ()
