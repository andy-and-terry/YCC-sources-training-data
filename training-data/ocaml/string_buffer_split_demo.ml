let words s =
  String.split_on_char ' ' s |> List.filter (fun w -> w <> "")

let capitalize w = String.capitalize_ascii (String.lowercase_ascii w)

let title_case s = words s |> List.map capitalize |> String.concat " "

let repeat s n =
  let b = Buffer.create (String.length s * n) in
  for _ = 1 to n do
    Buffer.add_string b s
  done;
  Buffer.contents b

let () =
  print_endline (title_case "  the qUICK   brown fox ");
  print_endline (repeat "ab" 3);
  Printf.printf "%d words\n" (List.length (words "a b  c"));
  Printf.printf "%s\n" (String.concat "-" (String.split_on_char ',' "x,y,z"));
  Printf.printf "%b %b\n" (String.starts_with ~prefix:"ab" "abc") (String.ends_with ~suffix:"bc" "abc")
