let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n > 1 && go 2

let () =
  let n = 28 in
  for p = 2 to n / 2 do
    if is_prime p && is_prime (n - p) then Printf.printf "%d + %d\n" p (n - p)
  done
