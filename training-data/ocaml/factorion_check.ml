let fact = [| 1; 1; 2; 6; 24; 120; 720; 5040; 40320; 362880 |]

let is_factorion n =
  let rec go m acc = if m = 0 then acc else go (m / 10) (acc + fact.(m mod 10)) in
  go n 0 = n

let () =
  for n = 1 to 49999 do
    if is_factorion n then Printf.printf "%d " n
  done;
  print_newline ()
