(* Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1. *)
let () =
  let rec go k r acc =
    if k = 0 then List.rev acc else go (k - 1) (r * 10 + 1) (string_of_int r :: acc)
  in
  print_endline (String.concat " " (go 8 1 []))
