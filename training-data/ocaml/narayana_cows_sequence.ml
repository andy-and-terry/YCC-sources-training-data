(* Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3) *)
let rec cows n a b c =
  if n = 0 then [] else a :: cows (n - 1) b c (a + c)

let () =
  print_endline (String.concat " " (List.map string_of_int (cows 15 1 1 1)))
