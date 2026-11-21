(* Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n. *)
let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let pow_mod b e m =
  let rec go b e r =
    if e = 0 then r
    else go (b * b mod m) (e / 2) (if e land 1 = 1 then r * b mod m else r)
  in
  go (b mod m) e 1

let is_prime n =
  let rec go p = p * p > n || (n mod p <> 0 && go (p + 1)) in
  n > 1 && go 2

let is_carmichael n =
  let rec ok a = a >= n || ((gcd a n <> 1 || pow_mod a (n - 1) n = 1) && ok (a + 1)) in
  (not (is_prime n)) && ok 2

let () =
  let n = ref 3 in
  while !n < 3000 do
    if is_carmichael !n then Printf.printf "%d " !n;
    n := !n + 2
  done;
  print_newline ()
