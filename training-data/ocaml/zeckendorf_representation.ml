let rec fibs a b limit =
  if a > limit then [] else a :: fibs b (a + b) limit

let rec zeckendorf n fs =
  match fs with
  | [] -> []
  | _ when n = 0 -> []
  | f :: rest -> if f <= n then f :: zeckendorf (n - f) rest else zeckendorf n rest

let () =
  zeckendorf 100 (List.rev (fibs 1 2 100))
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
