module SMap = Map.Make (String)
module ISet = Set.Make (Int)

let () =
  let m = SMap.(empty |> add "b" 2 |> add "a" 1 |> add "c" 3) in
  SMap.iter (fun k v -> Printf.printf "%s=%d " k v) m;
  print_newline ();
  Printf.printf "%d %b\n" (SMap.find "b" m) (SMap.mem "z" m);
  let m2 = SMap.map (fun v -> v * 10) (SMap.remove "a" m) in
  Printf.printf "%d\n" (SMap.fold (fun _ v acc -> acc + v) m2 0);
  let s = ISet.of_list [ 3; 1; 2; 3 ] in
  let t = ISet.of_list [ 2; 3; 4 ] in
  Printf.printf "%d %d %d\n" (ISet.cardinal s) (ISet.cardinal (ISet.inter s t)) (ISet.max_elt (ISet.union s t));
  print_endline (String.concat "," (List.map string_of_int (ISet.elements (ISet.diff s t))))
