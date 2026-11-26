(* Circular primes below 100; expect 13. *)
let is_prime n =
  let rec go d = d * d > n || (n mod d <> 0 && go (d + 1)) in
  n > 1 && go 2

let circular n =
  let s = string_of_int n in
  let len = String.length s in
  let ok = ref true in
  for i = 0 to len - 1 do
    let r = String.sub s i (len - i) ^ String.sub s 0 i in
    if not (is_prime (int_of_string r)) then ok := false
  done;
  !ok

let () =
  let c = ref 0 in
  for n = 2 to 99 do if circular n then incr c done;
  Printf.printf "%d\n" !c
