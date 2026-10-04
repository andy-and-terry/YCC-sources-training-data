let () =
  let n = 4 in
  let m = Array.make_matrix n n 0 in
  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      m.(i).(j) <- (i + 1) * (j + 1)
    done
  done;
  Array.iter (fun row ->
    Array.iter (fun v -> Printf.printf "%3d" v) row;
    print_newline ()) m;
  let squares = Array.init 6 (fun i -> i * i) in
  Printf.printf "sum = %d\n" (Array.fold_left ( + ) 0 squares);
  Array.sort (fun a b -> compare b a) squares;
  Array.iter (Printf.printf "%d ") squares;
  print_newline ()
