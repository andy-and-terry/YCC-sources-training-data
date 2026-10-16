let () =
  let nested = [ [ 1; 2 ]; []; [ 3 ]; [ 4; 5; 6 ] ] in
  let flat = List.concat nested in
  List.iter (Printf.printf "%d ") flat;
  print_newline ();
  let words = [ "ab"; "cd" ] in
  let chars = List.concat_map (fun w -> List.init (String.length w) (String.get w)) words in
  List.iter (Printf.printf "%c ") chars;
  print_newline ();
  let appended = [ 1; 2 ] @ [ 3; 4 ] @ [ 5 ] in
  Printf.printf "%d elements\n" (List.length appended);
  let rev = List.rev_append [ 3; 2; 1 ] [ 4; 5 ] in
  List.iter (Printf.printf "%d ") rev;
  print_newline ()
