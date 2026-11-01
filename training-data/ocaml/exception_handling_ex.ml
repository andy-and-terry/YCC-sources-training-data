exception Negative of int

let check n = if n < 0 then raise (Negative n) else n

let () =
  List.iter
    (fun n ->
      try Printf.printf "ok %d\n" (check n)
      with Negative k -> Printf.printf "neg %d\n" k)
    [ 1; -2 ];
  try ignore (List.assoc "z" [ ("a", 1) ]) with Not_found -> print_endline "missing"
