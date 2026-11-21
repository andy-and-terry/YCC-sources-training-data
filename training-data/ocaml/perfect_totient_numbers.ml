(* Perfect totient numbers: sum of the iterated totient chain down to 1 equals n. *)
let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let phi n =
  let c = ref 0 in
  for k = 1 to n do
    if gcd k n = 1 then incr c
  done;
  !c

let rec chain_sum m = if m <= 1 then 0 else phi m + chain_sum (phi m)

let () =
  for n = 2 to 199 do
    if chain_sum n = n then Printf.printf "%d " n
  done;
  print_newline ()
