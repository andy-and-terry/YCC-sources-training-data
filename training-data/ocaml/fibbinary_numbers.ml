(* Fibbinary numbers: no two adjacent 1 bits. *)
let () =
  for n = 0 to 49 do
    if n land (n lsr 1) = 0 then Printf.printf "%d " n
  done;
  print_newline ()
