let is_palindrome s =
  let normalized =
    String.to_seq s
    |> Seq.filter (fun c -> (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))
    |> Seq.map Char.lowercase_ascii
    |> String.of_seq
  in
  let reversed = String.init (String.length normalized) (fun i -> normalized.[String.length normalized - 1 - i]) in
  normalized = reversed

let () =
  print_endline (string_of_bool (is_palindrome "A man, a plan, a canal: Panama"));
  print_endline (string_of_bool (is_palindrome "hello"))
