let () =
  let xs = [1; 2; 3; 4] in
  Printf.printf "%d\n" (List.fold_left ( + ) 0 xs);
  print_endline (String.concat "," (List.map string_of_int (List.rev xs)));
  Printf.printf "%b\n" (List.exists (fun x -> x > 3) xs)
