let () =
  let s = "Hello, World" in
  Printf.printf "%d %s %s\n" (String.length s) (String.uppercase_ascii s) (String.sub s 7 5);
  Printf.printf "%b %c %d\n" (String.contains s 'W') s.[0] (String.index s ',');
  let b = Buffer.create 16 in
  List.iter (fun w -> Buffer.add_string b w; Buffer.add_char b ' ') [ "a"; "b"; "c" ];
  Printf.printf "[%s]\n" (String.trim (Buffer.contents b));
  Printf.printf "%5d|%-5d|%05d|%x|%8.3f|%s|%5s|\n" 42 42 42 255 3.14159 "str" "ab";
  print_endline (String.concat "-" (String.split_on_char ',' "x,y,z"));
  print_endline (String.map (fun c -> if c = 'l' then 'L' else c) s);
  Printf.printf "%s\n" (Printf.sprintf "%d%%" 50)
