(* Positive n expressible as a*a + b*b with a, b >= 0. *)
let representable n =
  let rec outer a =
    if a * a > n then false
    else
      let b = int_of_float (Float.round (sqrt (float_of_int (n - (a * a))))) in
      (a * a) + (b * b) = n || outer (a + 1)
  in
  outer 0

let () =
  for n = 1 to 30 do
    if representable n then Printf.printf "%d " n
  done;
  print_newline ()
