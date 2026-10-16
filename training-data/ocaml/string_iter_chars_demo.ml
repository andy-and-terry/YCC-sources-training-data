let () =
  let s = "OCaml 4.14!" in
  String.iter (fun c -> Printf.printf "[%c]" c) s;
  print_newline ();
  String.iteri (fun i c -> if c = ' ' then Printf.printf "space at %d\n" i) s;
  let upper = String.uppercase_ascii s in
  let lower = String.lowercase_ascii s in
  print_endline upper;
  print_endline lower;
  let mapped = String.map (fun c -> if c = 'a' then '*' else c) s in
  print_endline mapped;
  Printf.printf "contains '!': %b\n" (String.contains s '!');
  Printf.printf "index of 'm': %d\n" (String.index s 'm')
