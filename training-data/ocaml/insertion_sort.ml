let rec insert x = function
  | [] -> [ x ]
  | h :: t when x <= h -> x :: h :: t
  | h :: t -> h :: insert x t

let insertion_sort lst = List.fold_left (fun acc x -> insert x acc) [] lst

let () =
  insertion_sort [ 12; 11; 13; 5; 6 ]
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
