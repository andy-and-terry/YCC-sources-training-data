(* Deficient numbers below 100; expect 76. *)
let proper_sum n =
  let t = ref 0 in
  for d = 1 to n - 1 do if n mod d = 0 then t := !t + d done;
  !t

let () =
  let c = ref 0 in
  for n = 1 to 99 do if proper_sum n < n then incr c done;
  Printf.printf "%d\n" !c
