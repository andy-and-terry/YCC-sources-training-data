(* Moebius function: 0 if n has a squared prime factor, else (-1)^k. *)
let mobius n =
  let rec go m p acc =
    if p * p > m then (if m > 1 then -acc else acc)
    else if m mod p = 0 then begin
      let m' = m / p in
      if m' mod p = 0 then 0 else go m' (p + 1) (-acc)
    end else go m (p + 1) acc
  in
  go n 2 1

let () =
  for n = 1 to 30 do Printf.printf "%d " (mobius n) done;
  print_newline ()
