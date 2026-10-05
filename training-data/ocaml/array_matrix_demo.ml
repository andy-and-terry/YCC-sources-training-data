let make_matrix rows cols f = Array.init rows (fun i -> Array.init cols (fun j -> f i j))

let transpose m =
  let rows = Array.length m and cols = Array.length m.(0) in
  make_matrix cols rows (fun i j -> m.(j).(i))

let print_matrix m =
  Array.iter
    (fun row ->
      Array.iter (Printf.printf "%3d") row;
      print_newline ())
    m

let () =
  let m = make_matrix 2 3 (fun i j -> (i * 3) + j + 1) in
  print_matrix m;
  print_endline "--";
  print_matrix (transpose m)
