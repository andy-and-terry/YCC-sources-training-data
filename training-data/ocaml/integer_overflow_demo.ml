let () =
  Printf.printf "max_int = %d\n" max_int;
  Printf.printf "min_int = %d\n" min_int;
  Printf.printf "max_int + 1 = %d\n" (max_int + 1);
  Printf.printf "wraps to min_int: %b\n" (max_int + 1 = min_int);
  Printf.printf "int32 max = %ld\n" Int32.max_int;
  Printf.printf "int64 max = %Ld\n" Int64.max_int;
  let big = Int64.mul 3_000_000_000L 4L in
  Printf.printf "3e9 * 4 = %Ld\n" big;
  Printf.printf "abs min_int = %d\n" (abs min_int);
  Printf.printf "-7 / 2 = %d, -7 mod 2 = %d\n" (-7 / 2) (-7 mod 2)
