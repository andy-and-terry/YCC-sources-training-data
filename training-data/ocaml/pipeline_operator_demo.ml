let () =
  [1; 2; 3; 4; 5]
  |> List.filter (fun x -> x mod 2 = 1)
  |> List.map (fun x -> x * 10)
  |> List.fold_left ( + ) 0
  |> Printf.printf "%d\n"
