(* Hexagonal numbers: n(2n-1). *)
let () =
  for n = 1 to 10 do Printf.printf "%d " (n * ((2 * n) - 1)) done;
  print_newline ()
