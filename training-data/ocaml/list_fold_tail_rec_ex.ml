let sum_sq l = List.fold_left (fun acc x -> acc + x * x) 0 l

let rec rev_acc acc = function [] -> acc | x :: t -> rev_acc (x :: acc) t

let () =
  Printf.printf "%d\n" (sum_sq [ 1; 2; 3; 4 ]);
  List.iter (Printf.printf "%d ") (rev_acc [] [ 1; 2; 3 ]);
  print_newline ()
