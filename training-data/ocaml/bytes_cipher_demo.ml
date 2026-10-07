let shift_char k c =
  if c >= 'a' && c <= 'z' then Char.chr (((Char.code c - 97 + k + 26) mod 26) + 97)
  else if c >= 'A' && c <= 'Z' then Char.chr (((Char.code c - 65 + k + 26) mod 26) + 65)
  else c

let rot k s =
  let b = Bytes.of_string s in
  Bytes.iteri (fun i c -> Bytes.set b i (shift_char k c)) b;
  Bytes.to_string b

let () =
  let msg = "Hello, World!" in
  let enc = rot 3 msg in
  Printf.printf "%s\n%s\n" enc (rot (-3) enc);
  let b = Bytes.make 5 '-' in
  Bytes.blit_string "ab" 0 b 1 2;
  print_endline (Bytes.to_string b);
  print_endline (String.uppercase_ascii msg);
  print_endline (String.map (fun c -> if c = 'l' then 'L' else c) msg);
  Printf.printf "%d %c\n" (Char.code 'A') (Char.chr 98)
