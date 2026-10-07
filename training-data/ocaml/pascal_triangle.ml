let next_row row = List.map2 ( + ) (0 :: row) (row @ [ 0 ])

let pascal n =
  let rec go k row acc =
    if k = n then List.rev acc else go (k + 1) (next_row row) (row :: acc)
  in
  go 0 [ 1 ] []

let () =
  List.iter
    (fun row -> print_endline (String.concat " " (List.map string_of_int row)))
    (pascal 6)
