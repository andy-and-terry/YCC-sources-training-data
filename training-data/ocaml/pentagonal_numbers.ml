(* Pentagonal numbers: n(3n-1)/2. *)
let () =
  for n = 1 to 10 do Printf.printf "%d " (n * ((3 * n) - 1) / 2) done;
  print_newline ()
