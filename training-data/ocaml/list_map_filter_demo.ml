let () =
  let nums = [1; 2; 3; 4; 5; 6; 7; 8] in
  let squares = List.map (fun x -> x * x) nums in
  let evens = List.filter (fun x -> x mod 2 = 0) nums in
  let indexed = List.mapi (fun i x -> (i, x)) [ "a"; "b"; "c" ] in
  List.iter (Printf.printf "%d ") squares;
  print_newline ();
  List.iter (Printf.printf "%d ") evens;
  print_newline ();
  List.iter (fun (i, s) -> Printf.printf "%d=%s " i s) indexed;
  print_newline ();
  let filtered = List.filter_map (fun x -> if x > 5 then Some (x * 10) else None) nums in
  List.iter (Printf.printf "%d ") filtered;
  print_newline ()
