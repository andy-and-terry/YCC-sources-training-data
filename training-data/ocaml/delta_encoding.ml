let delta_encode = function
  | [] -> []
  | x :: _ as xs -> x :: List.map2 ( - ) (List.tl xs) (List.filteri (fun i _ -> i < List.length xs - 1) xs)

let delta_decode ds =
  List.rev (snd (List.fold_left (fun (acc, out) d -> let v = acc + d in (v, v :: out)) (0, []) ds))

let () =
  let d = delta_encode [ 10; 12; 15; 15; 20 ] in
  List.iter (Printf.printf "%d ") d; print_newline ();
  List.iter (Printf.printf "%d ") (delta_decode d); print_newline ()
