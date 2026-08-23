let () =
  [ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ]
  |> List.filter (fun n -> n mod 2 = 0)
  |> List.map (fun n -> n * n)
  |> List.fold_left ( + ) 0
  |> Printf.printf "%d\n"
