let stern count =
  let seq = Array.make (max count 2) 0 in
  seq.(1) <- 1;
  for i = 2 to count - 1 do
    seq.(i) <- (if i mod 2 = 0 then seq.(i / 2) else seq.(i / 2) + seq.(i / 2 + 1))
  done;
  Array.sub seq 0 count

let () =
  Array.iter (Printf.printf "%d ") (stern 15);
  print_newline () (* 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 *)
