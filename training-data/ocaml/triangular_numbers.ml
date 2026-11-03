let triangular count =
  let rec go n sum acc =
    if n > count then List.rev acc else go (n + 1) (sum + n) ((sum + n) :: acc)
  in
  go 1 0 []

let () = List.iter (Printf.printf "%d ") (triangular 10); print_newline ()
