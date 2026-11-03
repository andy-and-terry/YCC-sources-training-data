let count_char c s =
  String.fold_left (fun n x -> if x = c then n + 1 else n) 0 (String.lowercase_ascii s)

let () =
  String.iter
    (fun v -> Printf.printf "%c=%d " v (count_char v "Education is beautiful"))
    "aeiou";
  print_newline ()
