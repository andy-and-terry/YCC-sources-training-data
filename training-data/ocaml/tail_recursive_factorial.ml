let factorial n =
  let rec go n acc = if n <= 1 then acc else go (n - 1) (acc * n) in
  go n 1

let () = print_int (factorial 10); print_newline ()
