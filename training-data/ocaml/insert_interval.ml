let insert_interval ivs (nlo, nhi) =
  let rec go acc (lo, hi) = function
    | (l, h) :: rest when h < lo -> go ((l, h) :: acc) (lo, hi) rest
    | (l, h) :: rest when l <= hi -> go acc (min lo l, max hi h) rest
    | rest -> List.rev_append acc ((lo, hi) :: rest)
  in
  go [] (nlo, nhi) ivs

let () =
  insert_interval [ (1, 3); (6, 9) ] (2, 5)
  |> List.iter (fun (a, b) -> Printf.printf "(%d,%d) " a b);
  print_newline () (* (1,5) (6,9) *)
