(* Sum of prime factors counted with multiplicity. *)
let sopfr n =
  let rec go n p acc =
    if n = 1 then acc
    else if p * p > n then acc + n
    else if n mod p = 0 then go (n / p) p (acc + p)
    else go n (p + 1) acc
  in
  go n 2 0

let () =
  for n = 2 to 109 do
    if sopfr n = sopfr (n + 1) then Printf.printf "%d " n
  done;
  print_newline ()
