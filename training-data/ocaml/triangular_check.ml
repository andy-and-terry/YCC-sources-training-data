(* n is triangular iff 8n + 1 is a perfect square. *)
let is_triangular n =
  let s = (8 * n) + 1 in
  let r = int_of_float (Float.round (sqrt (float_of_int s))) in
  r * r = s

let () =
  for n = 0 to 20 do
    if is_triangular n then Printf.printf "%d " n
  done;
  print_newline ()
