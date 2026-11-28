let is_pronic x =
  let n = int_of_float (sqrt (float_of_int x)) in
  n * (n + 1) = x

let () =
  List.init 10 (fun n -> n * (n + 1)) |> List.iter (Printf.printf "%d ");
  print_newline (); (* 0 2 6 12 20 30 42 56 72 90 *)
  Printf.printf "%b %b\n" (is_pronic 56) (is_pronic 57) (* true false *)
