let () =
  let sum = ref 0 in
  for i = 1 to 10 do sum := !sum + i done;
  Printf.printf "%d\n" !sum;
  let i = ref 0 in
  while !i < 3 do Printf.printf "%d " !i; incr i done;
  print_newline ();
  let a = Array.make 5 0 in
  Array.iteri (fun i _ -> a.(i) <- i * i) a;
  Printf.printf "%s\n" (String.concat " " (Array.to_list (Array.map string_of_int a)));
  let b = Array.copy a in
  Array.sort (fun x y -> compare y x) b;
  Printf.printf "%d %d %d\n" b.(0) (Array.length b) (Array.fold_left ( + ) 0 a);
  let m = Array.make_matrix 2 3 1 in
  m.(1).(2) <- 7;
  Printf.printf "%d\n" (Array.fold_left (fun acc r -> acc + Array.fold_left ( + ) 0 r) 0 m)
