let rec my_gcd a b = if b = 0 then abs a else my_gcd b (a mod b)
let my_lcm a b = abs (a * b) / my_gcd a b

let () =
  print_int (my_gcd 48 18); print_newline ();
  print_int (my_lcm 4 6); print_newline ()
