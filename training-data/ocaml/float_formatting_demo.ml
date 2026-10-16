let () =
  let x = 1234.56789 in
  Printf.printf "%f\n" x;
  Printf.printf "%.2f\n" x;
  Printf.printf "%10.1f|\n" x;
  Printf.printf "%-10.1f|\n" x;
  Printf.printf "%e\n" x;
  Printf.printf "%g\n" x;
  Printf.printf "floor=%.0f ceil=%.0f round=%.0f trunc=%.0f\n"
    (floor 2.5) (ceil 2.5) (Float.round 2.5) (Float.trunc (-2.5));
  Printf.printf "nan is nan: %b\n" (Float.is_nan (0.0 /. 0.0));
  Printf.printf "1/0 = %f\n" (1.0 /. 0.0);
  Printf.printf "int_of_float 3.9 = %d\n" (int_of_float 3.9)
