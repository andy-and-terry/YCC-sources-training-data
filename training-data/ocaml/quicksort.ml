let rec quicksort = function
  | [] -> []
  | pivot :: rest ->
      let smaller = List.filter (fun x -> x < pivot) rest in
      let larger = List.filter (fun x -> x >= pivot) rest in
      quicksort smaller @ [ pivot ] @ quicksort larger

let () =
  quicksort [ 5; 3; 8; 1; 9; 2 ]
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
