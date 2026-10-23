let woodall n = n * (1 lsl n) - 1

let () =
  List.init 10 (fun i -> string_of_int (woodall (i + 1)))
  |> String.concat " "
  |> print_endline
