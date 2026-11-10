let tau n =
  let c = ref 0 in
  for d = 1 to n do if n mod d = 0 then incr c done;
  !c

let () =
  for n = 1 to 59 do if n mod tau n = 0 then Printf.printf "%d " n done;
  print_newline ()
  (* 1 2 8 9 12 18 24 36 40 56 *)
