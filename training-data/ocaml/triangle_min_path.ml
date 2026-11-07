let minimum_total triangle =
  let rows = List.rev triangle in
  match rows with
  | [] -> 0
  | bottom :: rest ->
      let step below row =
        List.mapi (fun i v -> v + min (List.nth below i) (List.nth below (i + 1))) row
      in
      List.hd (List.fold_left step bottom rest)

let () =
  Printf.printf "%d\n" (minimum_total [ [ 2 ]; [ 3; 4 ]; [ 6; 5; 7 ]; [ 4; 1; 8; 3 ] ]) (* 11 *)
