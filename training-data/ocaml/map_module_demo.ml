module SMap = Map.Make (String)

let () =
  let m =
    List.fold_left
      (fun acc w ->
        let n = try SMap.find w acc with Not_found -> 0 in
        SMap.add w (n + 1) acc)
      SMap.empty
      [ "a"; "b"; "a"; "c"; "b"; "a" ]
  in
  SMap.iter (fun k v -> Printf.printf "%s -> %d\n" k v) m;
  let doubled = SMap.map (fun v -> v * 2) m in
  Printf.printf "sum doubled = %d\n" (SMap.fold (fun _ v acc -> v + acc) doubled 0);
  match SMap.min_binding_opt m with
  | Some (k, v) -> Printf.printf "min: %s %d\n" k v
  | None -> ()
