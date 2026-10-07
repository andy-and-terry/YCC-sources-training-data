module SMap = Map.Make (String)

let () =
  let m =
    List.fold_left
      (fun acc (k, v) -> SMap.add k v acc)
      SMap.empty
      [ ("one", 1); ("two", 2); ("three", 3) ]
  in
  let m = SMap.update "two" (function Some v -> Some (v * 10) | None -> Some 0) m in
  let m = SMap.remove "one" m in
  SMap.iter (fun k v -> Printf.printf "%s -> %d\n" k v) m;
  Printf.printf "cardinal=%d\n" (SMap.cardinal m);
  (match SMap.find_opt "four" m with
   | Some v -> Printf.printf "four=%d\n" v
   | None -> print_endline "four missing");
  Printf.printf "total=%d\n" (SMap.fold (fun _ v acc -> acc + v) m 0)
