(* Square of the sum minus sum of squares for 1..10 (expect 2640) *)
let () =
  let xs = List.init 10 (fun i -> i + 1) in
  let sum = List.fold_left ( + ) 0 xs in
  let squares = List.fold_left (fun a x -> a + x * x) 0 xs in
  print_endline (string_of_int (sum * sum - squares))
