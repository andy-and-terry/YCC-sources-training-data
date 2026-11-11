(* Pronic numbers n(n+1) *)
let term n = n * (n + 1)

let () =
  List.init 10 term |> List.map string_of_int |> String.concat " " |> print_endline
