let () =
  let names = [ "ann"; "bob"; "cy" ] in
  let ages = [ 31; 27; 45 ] in
  let pairs = List.combine names ages in
  List.iter (fun (n, a) -> Printf.printf "%s is %d\n" n a) pairs;
  let ns, ags = List.split pairs in
  Printf.printf "%s | %s\n" (String.concat "," ns)
    (String.concat "," (List.map string_of_int ags));
  List.iter2 (fun n a -> Printf.printf "%s:%d " n a) names ages;
  print_newline ();
  let sums = List.map2 ( + ) [ 1; 2; 3 ] [ 10; 20; 30 ] in
  List.iter (Printf.printf "%d ") sums;
  print_newline ()
