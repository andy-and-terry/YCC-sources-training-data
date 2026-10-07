module CMap = Map.Make (Char)

let freq s =
  String.fold_left
    (fun m c ->
      CMap.update c (function None -> Some 1 | Some n -> Some (n + 1)) m)
    CMap.empty s

let () =
  CMap.iter (fun c n -> Printf.printf "%c: %d\n" c n) (freq "mississippi")
