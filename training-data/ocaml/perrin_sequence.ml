(* Perrin sequence P(n)=P(n-2)+P(n-3) *)
let () =
  let v = Array.make 10 0 in
  v.(0) <- 3; v.(1) <- 0; v.(2) <- 2;
  for i = 3 to 9 do v.(i) <- v.(i - 2) + v.(i - 3) done;
  Array.to_list v |> List.map string_of_int |> String.concat " " |> print_endline
