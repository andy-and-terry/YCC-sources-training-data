let is_vowel c = String.contains "aeiou" (Char.lowercase_ascii c)

let count_vowels s =
  let n = ref 0 in
  String.iter (fun c -> if is_vowel c then incr n) s;
  !n

let capitalize_words s =
  String.split_on_char ' ' s
  |> List.map String.capitalize_ascii
  |> String.concat " "

let () =
  Printf.printf "vowels: %d\n" (count_vowels "Functional Programming");
  print_endline (capitalize_words "the quick brown fox");
  print_endline (String.trim "   padded  ");
  print_endline (String.sub "ocaml language" 0 5);
  Printf.printf "%b\n" (String.starts_with ~prefix:"oc" "ocaml")
