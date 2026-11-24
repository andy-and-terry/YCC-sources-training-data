(* Aliquot sequence: replace n by the sum of its proper divisors. *)
let aliquot_sum n =
  let s = ref 0 in
  for d = 1 to n / 2 do if n mod d = 0 then s := !s + d done;
  !s

let () =
  let rec go n count =
    Printf.printf "%d " n;
    if n > 1 && count < 19 then go (aliquot_sum n) (count + 1)
  in
  go 12 0;
  print_newline ()
