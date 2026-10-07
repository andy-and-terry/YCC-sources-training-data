let () =
  let sum = ref 0 in
  for i = 1 to 10 do
    sum := !sum + i
  done;
  Printf.printf "sum 1..10 = %d\n" !sum;
  let n = ref 27 and steps = ref 0 in
  while !n <> 1 do
    n := if !n mod 2 = 0 then !n / 2 else (3 * !n) + 1;
    incr steps
  done;
  Printf.printf "collatz steps = %d\n" !steps;
  for i = 5 downto 1 do print_int i; print_char ' ' done;
  print_newline ()
