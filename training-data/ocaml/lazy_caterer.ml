let pieces cuts = (cuts * cuts + cuts + 2) / 2

let () =
  for n = 0 to 9 do Printf.printf "%d " (pieces n) done;
  print_newline ()
  (* 1 2 4 7 11 16 22 29 37 46 *)
