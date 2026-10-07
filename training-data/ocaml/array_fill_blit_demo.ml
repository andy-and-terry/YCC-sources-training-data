let () =
  let a = Array.make 8 0 in
  Array.fill a 2 3 7;
  let b = Array.init 4 (fun i -> i + 1) in
  Array.blit b 0 a 5 3;
  Array.iter (Printf.printf "%d ") a;
  print_newline ();
  let sub = Array.sub a 2 4 in
  Printf.printf "sum=%d\n" (Array.fold_left ( + ) 0 sub);
  let c = Array.append b b in
  Array.sort (fun x y -> compare y x) c;
  Array.iter (Printf.printf "%d ") c;
  print_newline ()
