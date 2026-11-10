let sigma n =
  let s = ref 0 in
  for d = 1 to n do if n mod d = 0 then s := !s + d done;
  !s

let () =
  for n = 1 to 99 do if sigma (sigma n) = 2 * n then Printf.printf "%d " n done;
  print_newline ()
  (* 2 4 16 64 *)
