let is_prime n =
  let rec go i = i * i > n || (n mod i <> 0 && go (i + 1)) in
  n >= 2 && go 2

let rev n =
  let rec go n acc = if n = 0 then acc else go (n / 10) ((acc * 10) + (n mod 10)) in
  go n 0

let () =
  for p = 2 to 99 do
    if is_prime p && rev p <> p && is_prime (rev p) then Printf.printf "%d " p
  done;
  print_newline ()
