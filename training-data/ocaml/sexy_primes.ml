(* Sexy primes below 100; expect 16 pairs. *)
let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n > 1 && go 2

let () =
  let c = ref 0 in
  for p = 2 to 99 do if is_prime p && is_prime (p + 6) then incr c done;
  Printf.printf "%d\n" !c
