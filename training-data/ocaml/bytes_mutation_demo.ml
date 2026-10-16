let () =
  let b = Bytes.of_string "hello world" in
  Bytes.set b 0 'H';
  Bytes.set b 6 'W';
  print_endline (Bytes.to_string b);
  let rev = Bytes.copy b in
  let n = Bytes.length b in
  for i = 0 to n - 1 do
    Bytes.set rev i (Bytes.get b (n - 1 - i))
  done;
  print_endline (Bytes.to_string rev);
  Bytes.fill b 0 5 '*';
  print_endline (Bytes.to_string b);
  let sub = Bytes.sub_string b 6 5 in
  Printf.printf "sub: %s\n" sub;
  let made = Bytes.make 3 'z' in
  Printf.printf "%s %d\n" (Bytes.to_string made) (Bytes.length made)
