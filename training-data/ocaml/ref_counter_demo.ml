let make_counter () =
  let count = ref 0 in
  let incr () = count := !count + 1 in
  let get () = !count in
  (incr, get)

let () =
  let incr_a, get_a = make_counter () in
  let incr_b, get_b = make_counter () in
  incr_a ();
  incr_a ();
  incr_b ();
  Printf.printf "a=%d b=%d\n" (get_a ()) (get_b ());
  let total = ref 0 in
  for i = 1 to 10 do
    total := !total + i
  done;
  Printf.printf "total=%d\n" !total;
  let n = ref 27 and steps = ref 0 in
  while !n <> 1 do
    n := if !n mod 2 = 0 then !n / 2 else (3 * !n) + 1;
    incr steps
  done;
  Printf.printf "collatz steps=%d\n" !steps
