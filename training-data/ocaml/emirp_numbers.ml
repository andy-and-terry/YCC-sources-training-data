let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n >= 2 && go 2

let rev n =
  let rec go n acc = if n = 0 then acc else go (n / 10) (acc * 10 + n mod 10) in
  go n 0

let () =
  for p = 2 to 199 do
    if rev p <> p && is_prime p && is_prime (rev p) then Printf.printf "%d " p
  done;
  print_newline () (* 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199 *)
