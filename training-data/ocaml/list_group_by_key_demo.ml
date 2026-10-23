let group_by f l =
  List.fold_left
    (fun acc x ->
      let k = f x in
      let cur = try List.assoc k acc with Not_found -> [] in
      (k, x :: cur) :: List.remove_assoc k acc)
    [] l
  |> List.map (fun (k, v) -> (k, List.rev v))
  |> List.sort compare

let () =
  group_by String.length [ "a"; "bb"; "c"; "dd"; "eee" ]
  |> List.iter (fun (k, v) -> Printf.printf "%d: %s\n" k (String.concat "," v))
