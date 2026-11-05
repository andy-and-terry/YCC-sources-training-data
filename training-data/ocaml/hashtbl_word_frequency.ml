let () =
  let t = Hashtbl.create 16 in
  List.iter
    (fun w ->
      let c = try Hashtbl.find t w with Not_found -> 0 in
      Hashtbl.replace t w (c + 1))
    [ "a"; "b"; "a"; "c"; "a" ];
  let l = Hashtbl.fold (fun k v acc -> (k, v) :: acc) t [] in
  List.iter (fun (k, v) -> Printf.printf "%s %d\n" k v) (List.sort compare l)
