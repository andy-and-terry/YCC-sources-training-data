let () =
  let counts = Hashtbl.create 16 in
  String.iter
    (fun c ->
      let n = try Hashtbl.find counts c with Not_found -> 0 in
      Hashtbl.replace counts c (n + 1))
    "mississippi";
  Hashtbl.fold (fun k v acc -> (k, v) :: acc) counts []
  |> List.sort compare
  |> List.iter (fun (k, v) -> Printf.printf "%c=%d\n" k v)
