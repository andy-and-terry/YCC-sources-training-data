(* Pernicious numbers: the popcount is prime. *)
let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n >= 2 && go 2

let rec popcount n = if n = 0 then 0 else (n land 1) + popcount (n lsr 1)

let () =
  for n = 1 to 20 do
    if is_prime (popcount n) then Printf.printf "%d " n
  done;
  print_newline ()
