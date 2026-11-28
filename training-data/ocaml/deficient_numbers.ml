let sigma n =
  let rec go d acc = if d > n then acc else go (d + 1) (if n mod d = 0 then acc + d else acc) in
  go 1 0

let () =
  for n = 1 to 20 do
    if sigma n < 2 * n then Printf.printf "%d " n
  done;
  print_newline ()
