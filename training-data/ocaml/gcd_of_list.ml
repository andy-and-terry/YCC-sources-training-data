let rec gcd a b = if b = 0 then abs a else gcd b (a mod b)

let gcd_all = List.fold_left gcd 0

let () =
  Printf.printf "%d\n" (gcd_all [ 12; 18; 24 ]);
  Printf.printf "%d\n" (gcd_all [ 7; 13 ])
