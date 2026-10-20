let () =
  Printf.printf "%d %d %d %d\n" (5 land 3) (5 lor 3) (5 lxor 3) (1 lsl 10);
  Printf.printf "%d %d\n" (-16 asr 2) (16 lsr 2);
  Printf.printf "%d %d %d\n" (7 / 2) (-7 / 2) (-7 mod 3);
  Printf.printf "%.3f %.3f %.0f %d\n" (sqrt 2.) (2. ** 10.) (floor 2.7) (int_of_float 3.99);
  Printf.printf "%b %b\n" (0.1 +. 0.2 = 0.3) (abs_float (0.1 +. 0.2 -. 0.3) < 1e-9);
  Printf.printf "%d %d\n" max_int min_int;
  Printf.printf "%Ld %s\n" (Int64.mul 3037000499L 3037000499L) (Int64.to_string Int64.max_int);
  Printf.printf "%d %d\n" (compare 3 5) (min 4 2 + max 4 2);
  Printf.printf "%s %s\n" (string_of_float 1.5) (string_of_bool true)
