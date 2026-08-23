let normalize s =
  String.to_seq s
  |> Seq.filter (fun c -> c <> ' ')
  |> Seq.map Char.lowercase_ascii
  |> List.of_seq
  |> List.sort compare

let is_anagram a b = normalize a = normalize b

let () =
  print_endline (string_of_bool (is_anagram "listen" "silent"));
  print_endline (string_of_bool (is_anagram "hello" "world"))
