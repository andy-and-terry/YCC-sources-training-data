let () =
  let l = [ 5; 3; 8; 1; 9; 2 ] in
  let show xs = String.concat "," (List.map string_of_int xs) in
  print_endline (show (List.sort compare l));
  print_endline (show (List.filter (fun x -> x mod 2 = 1) l));
  Printf.printf "%d %d\n" (List.fold_left ( + ) 0 l) (List.length l);
  let evens, odds = List.partition (fun x -> x mod 2 = 0) l in
  Printf.printf "%s | %s\n" (show evens) (show odds);
  print_endline (show (List.rev (List.map (fun x -> x * x) l)));
  Printf.printf "%b %b\n" (List.exists (fun x -> x > 8) l) (List.for_all (fun x -> x > 0) l);
  List.iteri (fun i x -> if i < 2 then Printf.printf "%d:%d " i x) l;
  print_newline ();
  let assoc = [ ("a", 1); ("b", 2) ] in
  Printf.printf "%d %s\n" (List.assoc "b" assoc) (String.concat "" (List.map fst assoc));
  print_endline (show (List.concat [ [ 1 ]; [ 2; 3 ] ] @ List.init 3 (fun i -> i * 10)))
