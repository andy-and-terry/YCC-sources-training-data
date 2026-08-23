let values =
  [ (1000, "M"); (900, "CM"); (500, "D"); (400, "CD"); (100, "C"); (90, "XC");
    (50, "L"); (40, "XL"); (10, "X"); (9, "IX"); (5, "V"); (4, "IV"); (1, "I") ]

let rec to_roman n =
  if n = 0 then ""
  else
    let value, symbol = List.find (fun (v, _) -> v <= n) values in
    symbol ^ to_roman (n - value)

let () = print_endline (to_roman 1994)
