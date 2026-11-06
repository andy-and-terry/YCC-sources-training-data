(* Repunits: numbers made only of the digit 1. *)
let () =
  let r = ref 0 in
  for _ = 1 to 5 do
    r := (!r * 10) + 1;
    Printf.printf "%d " !r
  done;
  print_newline ()
