let () =
  let h = Hashtbl.create 16 in
  List.iter (fun w ->
    let c = try Hashtbl.find h w with Not_found -> 0 in
    Hashtbl.replace h w (c + 1)) ["a"; "b"; "a"];
  Hashtbl.iter (fun k v -> Printf.printf "%s=%d\n" k v) h
