let () =
  let b = Buffer.create 16 in
  List.iter (fun s -> Buffer.add_string b (String.uppercase_ascii s); Buffer.add_char b ';') ["a"; "b"];
  print_endline (Buffer.contents b);
  print_endline (String.concat "," (List.map string_of_int [1; 2; 3]))
