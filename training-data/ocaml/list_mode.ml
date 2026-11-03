module IM = Map.Make (Int)

let modes items =
  let counts =
    List.fold_left
      (fun m x -> IM.update x (function None -> Some 1 | Some c -> Some (c + 1)) m)
      IM.empty items
  in
  let top = IM.fold (fun _ c acc -> max c acc) counts 0 in
  IM.bindings counts |> List.filter (fun (_, c) -> c = top) |> List.map fst

let () = List.iter (Printf.printf "%d ") (modes [ 1; 2; 2; 3; 3; 4 ]); print_newline ()
