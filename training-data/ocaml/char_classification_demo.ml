let classify c =
  match c with
  | 'a' .. 'z' -> "lower"
  | 'A' .. 'Z' -> "upper"
  | '0' .. '9' -> "digit"
  | ' ' | '\t' | '\n' -> "space"
  | _ -> "other"

let () =
  String.iter (fun c -> Printf.printf "%C -> %s\n" c (classify c)) "aZ7 !";
  Printf.printf "code of 'A': %d\n" (Char.code 'A');
  Printf.printf "chr 100: %c\n" (Char.chr 100);
  Printf.printf "upper of q: %c\n" (Char.uppercase_ascii 'q');
  let digit_value c = Char.code c - Char.code '0' in
  Printf.printf "digit_value '8' = %d\n" (digit_value '8')
