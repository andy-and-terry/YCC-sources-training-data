let rec my_power base exp =
  if exp = 0 then 1
  else if exp mod 2 = 0 then
    let half = my_power base (exp / 2) in
    half * half
  else base * my_power base (exp - 1)

let () =
  print_int (my_power 2 10); print_newline ();
  print_int (my_power 3 5); print_newline ()
