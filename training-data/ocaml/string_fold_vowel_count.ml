let count_vowels s =
  String.fold_left
    (fun n c -> if String.contains "aeiouAEIOU" c then n + 1 else n)
    0 s

let () = Printf.printf "%d\n" (count_vowels "Functional Programming")
