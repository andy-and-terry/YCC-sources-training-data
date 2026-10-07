let rec ext_gcd a b = if b = 0 then (a, 1, 0) else
  let g, x1, y1 = ext_gcd b (a mod b) in
  (g, y1, x1 - ((a / b) * y1))

let mod_inverse a m =
  let _, x, _ = ext_gcd a m in
  ((x mod m) + m) mod m

let chinese_remainder remainders moduli =
  let prod = List.fold_left ( * ) 1 moduli in
  List.fold_left2
    (fun acc r m ->
      let pi = prod / m in
      acc + (r * pi * mod_inverse pi m))
    0 remainders moduli
  mod prod

let () =
  (* x = 2 mod 3, x = 3 mod 5, x = 2 mod 7 -> x = 23 *)
  Printf.printf "%d\n" (chinese_remainder [ 2; 3; 2 ] [ 3; 5; 7 ])
