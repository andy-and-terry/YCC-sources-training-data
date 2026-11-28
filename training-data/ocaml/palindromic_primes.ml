let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n >= 2 && go 2

let rev n =
  let rec go n acc = if n = 0 then acc else go (n / 10) (acc * 10 + n mod 10) in
  go n 0

let () =
  for n = 2 to 199 do
    if rev n = n && is_prime n then Printf.printf "%d " n
  done;
  print_newline () (* 2 3 5 7 11 101 131 151 181 191 *)
