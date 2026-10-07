let min_max = function
  | [] -> None
  | x :: rest ->
      Some
        (List.fold_left
           (fun (lo, hi) y -> (min lo y, max hi y))
           (x, x) rest)

let () =
  match min_max [ 4; -2; 9; 0; 7 ] with
  | Some (lo, hi) -> Printf.printf "min=%d max=%d\n" lo hi
  | None -> print_endline "empty"
