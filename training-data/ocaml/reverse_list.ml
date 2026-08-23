let rec reverse_list = function
  | [] -> []
  | h :: t -> reverse_list t @ [ h ]

let () =
  reverse_list [ 1; 2; 3; 4; 5 ] |> List.map string_of_int |> String.concat " " |> print_endline
