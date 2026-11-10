let central_delannoy n =
  let g = Array.make_matrix (n + 1) (n + 1) 1 in
  for i = 1 to n do
    for j = 1 to n do
      g.(i).(j) <- g.(i - 1).(j) + g.(i).(j - 1) + g.(i - 1).(j - 1)
    done
  done;
  g.(n).(n)

let () =
  List.iter (fun n -> Printf.printf "%d " (central_delannoy n)) [0; 1; 2; 3; 4; 5];
  print_newline ()
  (* 1 3 13 63 321 1683 *)
