(* Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1. *)
let () =
  List.init 10 (fun n -> string_of_int (n * (n + 1) / 2 + 1))
  |> String.concat " " |> print_endline
