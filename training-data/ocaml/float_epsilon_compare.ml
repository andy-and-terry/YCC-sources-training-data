let approx_equal ?(eps = 1e-9) a b = Float.abs (a -. b) <= eps

let () =
  let a = 0.1 +. 0.2 in
  Printf.printf "0.1 + 0.2 = %.17g\n" a;
  Printf.printf "a = 0.3 : %b\n" (a = 0.3);
  Printf.printf "approx : %b\n" (approx_equal a 0.3);
  Printf.printf "approx with tiny eps : %b\n" (approx_equal ~eps:1e-20 a 0.3);
  Printf.printf "epsilon_float = %g\n" epsilon_float;
  Printf.printf "compare nan nan = %d\n" (compare nan nan);
  Printf.printf "nan = nan : %b\n" (nan = nan)
