(* Ways to write n as a sum of two or more consecutive positive integers. *)
let polite_ways n =
  let rec go k ways =
    if k * (k + 1) / 2 > n then ways
    else go (k + 1) (if (n - (k * (k - 1) / 2)) mod k = 0 then ways + 1 else ways)
  in
  go 2 0

let () =
  for n = 1 to 16 do
    Printf.printf "%d " (polite_ways n)
  done;
  print_newline ()
