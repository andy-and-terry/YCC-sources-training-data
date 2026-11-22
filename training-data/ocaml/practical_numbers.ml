(* Practical numbers: every m in 1..n is a sum of distinct divisors of n. *)
let is_practical n =
  let reach = ref 1 in (* bit i set <=> i is a subset sum *)
  for d = 1 to n do
    if n mod d = 0 then reach := !reach lor (!reach lsl d)
  done;
  let mask = (1 lsl (n + 1)) - 1 in
  !reach land mask = mask

let () =
  List.init 40 (fun i -> i + 1)
  |> List.filter is_practical
  |> List.map string_of_int |> String.concat " " |> print_endline
