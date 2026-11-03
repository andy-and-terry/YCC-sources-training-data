let is_perfect_square n =
  n >= 0
  &&
  let r = int_of_float (sqrt (float_of_int n) +. 0.5) in
  r * r = n

let () =
  for n = 0 to 29 do
    if is_perfect_square n then Printf.printf "%d " n
  done;
  print_newline ()
