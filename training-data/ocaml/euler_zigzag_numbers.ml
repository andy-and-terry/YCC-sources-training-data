(* Euler zigzag numbers via the Seidel-Entringer boustrophedon. *)
let step row =
  List.rev (List.fold_left (fun acc x -> (List.hd acc + x) :: acc) [ 0 ] (List.rev row))

let () =
  let rec go k row acc =
    if k = 0 then List.rev acc
    else go (k - 1) (step row) (List.nth row (List.length row - 1) :: acc)
  in
  print_endline (String.concat " " (List.map string_of_int (go 10 [ 1 ] [])))
