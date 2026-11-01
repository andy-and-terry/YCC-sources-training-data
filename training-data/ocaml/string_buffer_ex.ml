let () =
  let b = Buffer.create 16 in
  for i = 1 to 3 do Buffer.add_string b (string_of_int i); Buffer.add_char b ',' done;
  print_endline (Buffer.contents b);
  print_endline (String.concat "-" (String.split_on_char ' ' "a b c"));
  print_endline (String.uppercase_ascii "ocaml")
