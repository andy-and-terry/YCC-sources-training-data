(* Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3) *)
let rec perrin n a b c =
  if n = 0 then [] else a :: perrin (n - 1) b c (a + b)

let () =
  print_endline (String.concat " " (List.map string_of_int (perrin 15 3 0 2)))
