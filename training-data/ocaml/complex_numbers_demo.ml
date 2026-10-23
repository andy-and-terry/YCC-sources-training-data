let real x = { Complex.re = x; im = 0.0 }

let show label (z : Complex.t) =
  Printf.printf "%-10s = %.3f %s %.3fi\n" label z.re
    (if z.im < 0.0 then "-" else "+")
    (abs_float z.im)

let () =
  let a = { Complex.re = 3.0; im = 4.0 } in
  let b = Complex.{ re = 1.0; im = -2.0 } in
  show "a" a;
  show "b" b;
  show "a + b" (Complex.add a b);
  show "a * b" (Complex.mul a b);
  show "a / b" (Complex.div a b);
  show "conj a" (Complex.conj a);
  show "sqrt(-4)" (Complex.sqrt (real (-4.0)));
  Printf.printf "|a|        = %.3f\n" (Complex.norm a);
  Printf.printf "arg a      = %.3f rad\n" (Complex.arg a);
  let euler = Complex.add (Complex.exp (Complex.mul Complex.i (real Float.pi))) Complex.one in
  show "e^(i*pi)+1" euler;
  let roots = List.init 4 (fun k -> Complex.polar 1.0 (2.0 *. Float.pi *. float_of_int k /. 4.0)) in
  List.iteri (fun k z -> show (Printf.sprintf "root %d" k) z) roots
