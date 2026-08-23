let () =
  let s = "Hello, OCaml World!" in
  print_endline (String.uppercase_ascii s);
  print_endline (String.lowercase_ascii s);
  print_int (String.length s); print_newline ();
  String.split_on_char ' ' s |> String.concat "|" |> print_endline
