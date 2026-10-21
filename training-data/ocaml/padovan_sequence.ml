(* Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1 *)
let rec padovan n (a, b, c) =
  if n = 0 then [] else a :: padovan (n - 1) (b, c, a + b)

let () =
  padovan 15 (1, 1, 1)
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
