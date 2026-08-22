let safe_divide a b = if b = 0 then None else Some (a / b)

let () =
  [ (10, 2); (5, 0); (9, 3) ]
  |> List.iter (fun (a, b) ->
         match safe_divide a b with
         | Some v -> Printf.printf "%d / %d = %d\n" a b v
         | None -> Printf.printf "%d / %d = undefined\n" a b);
  [ Some 1; None; Some 3 ]
  |> List.filter_map (fun x -> x)
  |> List.fold_left ( + ) 0
  |> Printf.printf "%d\n"
