let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let () =
  Printf.printf "%d\n" (gcd 48 18);
  Printf.printf "%d\n" (gcd 100 75)
