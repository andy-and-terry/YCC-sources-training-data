let prime_factor_count n =
  let rec go n p count =
    if p * p > n then if n > 1 then count + 1 else count
    else if n mod p = 0 then go (n / p) p (count + 1)
    else go n (p + 1) count
  in
  go n 2 0

let () =
  for n = 2 to 29 do
    if prime_factor_count n = 2 then Printf.printf "%d " n
  done;
  print_newline ()
