let counts l = List.fold_left (fun acc x ->
  let c = try List.assoc x acc with Not_found -> 0 in
  (x, c + 1) :: List.remove_assoc x acc) [] l
let () = List.iter (fun (k, v) -> Printf.printf "%s=%d\n" k v) (List.sort compare (counts ["a"; "b"; "a"]))
