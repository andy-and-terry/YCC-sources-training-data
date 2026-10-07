let () =
  Printf.printf "%5d|%-5d|%05d\n" 42 42 42;
  Printf.printf "%8.3f|%e\n" 3.14159 12345.678;
  Printf.printf "%x %X %o\n" 255 255 8;
  Printf.printf "%s has %d chars\n" "hello" (String.length "hello");
  let s = Printf.sprintf "%c-%b" 'z' true in
  print_endline s
