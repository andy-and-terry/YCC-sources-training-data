(* Complex arithmetic with the standard Complex module *)
let show (z : Complex.t) = Printf.sprintf "%.2f%+.2fi" z.re z.im

let () =
  let a = { Complex.re = 3.0; im = 4.0 } in
  let b = { Complex.re = 1.0; im = -2.0 } in
  Printf.printf "a     = %s\n" (show a);
  Printf.printf "a + b = %s\n" (show (Complex.add a b));
  Printf.printf "a * b = %s\n" (show (Complex.mul a b));
  Printf.printf "a / b = %s\n" (show (Complex.div a b));
  Printf.printf "conj a = %s\n" (show (Complex.conj a));
  Printf.printf "|a|   = %.2f\n" (Complex.norm a);
  Printf.printf "i^2   = %s\n" (show (Complex.mul Complex.i Complex.i));
  let root = Complex.sqrt { Complex.re = -4.0; im = 0.0 } in
  Printf.printf "sqrt(-4) = %s\n" (show root)
