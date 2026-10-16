let () =
  let i = ref 0 in
  while !i < 5 do
    Printf.printf "i=%d\n" !i;
    incr i
  done;
  let n = ref 27 and steps = ref 0 in
  while !n <> 1 do
    n := if !n mod 2 = 0 then !n / 2 else (3 * !n) + 1;
    incr steps
  done;
  Printf.printf "collatz steps from 27: %d\n" !steps;
  for j = 10 downto 7 do
    Printf.printf "%d " j
  done;
  print_newline ()
