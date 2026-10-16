exception Parse_error of int * string
exception Not_found_key of string

let parse_digit pos c =
  if c >= '0' && c <= '9' then Char.code c - Char.code '0'
  else raise (Parse_error (pos, Printf.sprintf "unexpected %C" c))

let parse s =
  let n = ref 0 in
  String.iteri (fun i c -> n := (!n * 10) + parse_digit i c) s;
  !n

let () =
  List.iter
    (fun s ->
      try Printf.printf "%s -> %d\n" s (parse s)
      with Parse_error (pos, msg) -> Printf.printf "%s -> error at %d: %s\n" s pos msg)
    [ "1234"; "12x4" ];
  try raise (Not_found_key "color")
  with Not_found_key k -> Printf.printf "missing key %s\n" k
