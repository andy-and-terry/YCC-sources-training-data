(* Centered square numbers 2n(n+1)+1 *)
let term n = ((2 * n) * (n + 1)) + 1

let () =
  List.init 10 term |> List.map string_of_int |> String.concat " " |> print_endline
