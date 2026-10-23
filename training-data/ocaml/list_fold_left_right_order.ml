let () =
  let xs = [ "a"; "b"; "c" ] in
  let l = List.fold_left (fun acc x -> acc ^ x) "" xs in
  let r = List.fold_right (fun x acc -> x ^ acc) xs "" in
  Printf.printf "left=%s right=%s\n" l r;
  let l2 = List.fold_left (fun acc x -> x :: acc) [] [ 1; 2; 3 ] in
  Printf.printf "reversed: %s\n" (String.concat "," (List.map string_of_int l2))
