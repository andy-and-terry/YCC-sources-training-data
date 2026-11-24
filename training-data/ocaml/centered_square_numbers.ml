(* Centered square numbers: n^2 + (n+1)^2. *)
let () =
  for n = 0 to 9 do Printf.printf "%d " ((n * n) + ((n + 1) * (n + 1))) done;
  print_newline ()
