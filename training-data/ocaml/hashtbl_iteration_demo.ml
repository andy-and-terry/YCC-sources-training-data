let () =
  let h = Hashtbl.create 16 in
  List.iter (fun (k, v) -> Hashtbl.replace h k v) [ ("one", 1); ("two", 2); ("three", 3) ];
  Hashtbl.replace h "two" 22;
  Printf.printf "length: %d\n" (Hashtbl.length h);
  let pairs = Hashtbl.fold (fun k v acc -> (k, v) :: acc) h [] in
  let sorted = List.sort compare pairs in
  List.iter (fun (k, v) -> Printf.printf "%s=%d\n" k v) sorted;
  Hashtbl.remove h "one";
  Printf.printf "mem one: %b, find_opt three: %s\n" (Hashtbl.mem h "one")
    (match Hashtbl.find_opt h "three" with Some v -> string_of_int v | None -> "-");
  Hashtbl.filter_map_inplace (fun _ v -> if v > 10 then Some (v * 2) else None) h;
  Hashtbl.iter (fun k v -> Printf.printf "kept %s=%d\n" k v) h
