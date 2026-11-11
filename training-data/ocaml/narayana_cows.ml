(* Narayana's cows N(n)=N(n-1)+N(n-3) *)
let () =
  let v = Array.make 10 0 in
  v.(0) <- 1; v.(1) <- 1; v.(2) <- 1;
  for i = 3 to 9 do v.(i) <- v.(i - 1) + v.(i - 3) done;
  Array.to_list v |> List.map string_of_int |> String.concat " " |> print_endline
