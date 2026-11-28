let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let rho n =
  if n mod 2 = 0 then 2
  else
    let f v = (v * v + 1) mod n in
    let rec loop x y =
      let x = f x and y = f (f y) in
      let d = gcd (abs (x - y)) n in
      if d = 1 then loop x y else d
    in
    loop 2 2

let () =
  let n = 8051 in
  let p = rho n in
  Printf.printf "%d = %d * %d\n" n p (n / p)
