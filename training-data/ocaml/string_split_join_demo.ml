let () =
  let parts = String.split_on_char ',' "a,b,,c" in
  List.iter (fun p -> Printf.printf "[%s]\n" p) parts;
  print_endline (String.concat "-" parts);
  print_endline (String.uppercase_ascii "shout");
  Printf.printf "%b\n" (String.contains "hello" 'e')
