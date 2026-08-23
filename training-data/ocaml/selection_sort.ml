let rec selection_sort = function
  | [] -> []
  | lst ->
      let min_val = List.fold_left min (List.hd lst) lst in
      let rest = List.filter (fun x -> x <> min_val) lst in
      min_val :: selection_sort rest

let () =
  selection_sort [ 5; 3; 8; 1; 9; 2 ]
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
