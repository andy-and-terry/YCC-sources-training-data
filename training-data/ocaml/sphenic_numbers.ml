let is_sphenic n =
  let rec go n p distinct =
    if p * p > n then distinct + if n > 1 then 1 else 0
    else if n mod p = 0 then
      let n' = n / p in
      if n' mod p = 0 then -100 else go n' (p + 1) (distinct + 1)
    else go n (p + 1) distinct
  in
  go n 2 0 = 3

let () =
  for n = 2 to 79 do
    if is_sphenic n then Printf.printf "%d " n
  done;
  print_newline ()
