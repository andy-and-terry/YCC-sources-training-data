(* Read the binary digits of i as base-4 digits. *)
let rec moser = function
  | 0 -> 0
  | i -> (i land 1) + 4 * moser (i lsr 1)

let () =
  for i = 0 to 9 do Printf.printf "%d " (moser i) done;
  print_newline ()
  (* 0 1 4 5 16 17 20 21 64 65 *)
