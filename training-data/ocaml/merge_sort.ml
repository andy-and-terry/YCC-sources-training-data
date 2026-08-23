let rec merge left right =
  match (left, right) with
  | [], r -> r
  | l, [] -> l
  | lx :: ls, rx :: rs when lx <= rx -> lx :: merge ls (rx :: rs)
  | l, rx :: rs -> rx :: merge l rs

let rec merge_sort = function
  | [] -> []
  | [ x ] -> [ x ]
  | lst ->
      let mid = List.length lst / 2 in
      let left = List.filteri (fun i _ -> i < mid) lst in
      let right = List.filteri (fun i _ -> i >= mid) lst in
      merge (merge_sort left) (merge_sort right)

let () =
  merge_sort [ 5; 2; 9; 1; 5; 6 ]
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
