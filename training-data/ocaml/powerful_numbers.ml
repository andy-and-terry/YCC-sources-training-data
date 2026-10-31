let is_powerful n =
  let rec go n p =
    if p * p > n then n = 1
    else if n mod p = 0 then
      if n mod (p * p) <> 0 then false
      else
        let rec strip m = if m mod p = 0 then strip (m / p) else m in
        go (strip n) (p + 1)
    else go n (p + 1)
  in
  go n 2

let () =
  for n = 1 to 100 do
    if is_powerful n then Printf.printf "%d " n
  done;
  print_newline ()
