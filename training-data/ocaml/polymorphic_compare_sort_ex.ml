let () =
  let words = [ "pear"; "fig"; "banana" ] in
  let by_len = List.sort (fun a b -> compare (String.length a) (String.length b)) words in
  print_endline (String.concat " " by_len);
  let pairs = List.sort compare [ (2, "b"); (1, "z"); (1, "a") ] in
  List.iter (fun (n, s) -> Printf.printf "%d%s " n s) pairs;
  print_newline ()
