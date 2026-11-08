let rec hanoi n a b c =
  if n = 0 then []
  else hanoi (n - 1) a c b @ [ (a, c) ] @ hanoi (n - 1) b a c

let () =
  let m = hanoi 3 "A" "B" "C" in
  Printf.printf "%d:" (List.length m);
  List.iter (fun (x, y) -> Printf.printf " %s->%s" x y) m;
  print_newline ()
