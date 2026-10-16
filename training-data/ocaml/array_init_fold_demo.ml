let () =
  let squares = Array.init 6 (fun i -> i * i) in
  Array.iter (Printf.printf "%d ") squares;
  print_newline ();
  let total = Array.fold_left ( + ) 0 squares in
  Printf.printf "total: %d\n" total;
  let doubled = Array.map (fun x -> x * 2) squares in
  Array.iteri (fun i x -> Printf.printf "[%d]=%d " i x) doubled;
  print_newline ();
  let sub = Array.sub squares 2 3 in
  Printf.printf "sub length %d, first %d\n" (Array.length sub) sub.(0);
  let joined = Array.append sub [| 100; 200 |] in
  Printf.printf "%s\n" (String.concat "," (Array.to_list (Array.map string_of_int joined)));
  Printf.printf "exists > 20: %b\n" (Array.exists (fun x -> x > 20) squares)
