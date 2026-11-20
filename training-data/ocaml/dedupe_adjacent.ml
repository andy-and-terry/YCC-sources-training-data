(* Remove consecutive duplicates from a list of chars. *)
let rec dedupe = function
  | a :: (b :: _ as rest) -> if a = b then dedupe rest else a :: dedupe rest
  | l -> l

let () =
  let chars = List.of_seq (String.to_seq "aabbbcdd") in
  print_endline (String.of_seq (List.to_seq (dedupe chars)))
