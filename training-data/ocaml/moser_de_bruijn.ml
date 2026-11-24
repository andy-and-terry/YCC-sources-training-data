(* Moser-de Bruijn sequence: binary digits of n read in base 4. *)
let rec moser n = if n = 0 then 0 else (n land 1) + (4 * moser (n lsr 1))

let () =
  for n = 0 to 11 do Printf.printf "%d " (moser n) done;
  print_newline ()
