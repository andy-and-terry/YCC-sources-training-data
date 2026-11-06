(* Emirps: primes whose digit reversal is a different prime. *)
let is_prime n =
  let rec go i = i * i > n || (n mod i <> 0 && go (i + 1)) in
  n >= 2 && go 2

let reverse n =
  let rec go n acc = if n = 0 then acc else go (n / 10) ((acc * 10) + (n mod 10)) in
  go n 0

let () =
  for n = 2 to 99 do
    let r = reverse n in
    if r <> n && is_prime n && is_prime r then Printf.printf "%d " n
  done;
  print_newline ()
