(* Population count (number of set bits) for 0..15 *)
let rec bits n = if n = 0 then 0 else (n land 1) + bits (n lsr 1)

let () =
  List.init 16 bits |> List.map string_of_int |> String.concat " " |> print_endline
