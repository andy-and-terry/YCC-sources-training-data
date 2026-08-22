let fibonacci n =
  let rec go i a b acc =
    if i = n then List.rev acc
    else go (i + 1) b (a + b) (a :: acc)
  in
  go 0 0 1 []

let () =
  fibonacci 11
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
