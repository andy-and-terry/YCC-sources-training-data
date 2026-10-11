let group_runs l =
  let rec go acc = function
    | [] -> List.rev acc
    | x :: rest -> (
        match acc with
        | (y, n) :: tl when y = x -> go ((y, n + 1) :: tl) rest
        | _ -> go ((x, 1) :: acc) rest)
  in
  go [] l

let () =
  let runs = group_runs [ 'a'; 'a'; 'b'; 'c'; 'c'; 'c'; 'a' ] in
  List.iter (fun (c, n) -> Printf.printf "%c x%d\n" c n) runs
