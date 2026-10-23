let cullen n = n * (1 lsl n) + 1

let () =
  List.init 10 (fun n -> string_of_int (cullen n))
  |> String.concat " "
  |> print_endline
