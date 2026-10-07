let combination_sum candidates target =
  let results = ref [] in
  let rec backtrack start remaining current =
    if remaining = 0 then results := List.rev current :: !results
    else if remaining > 0 then
      List.iteri
        (fun offset c ->
          let i = start + offset in
          backtrack i (remaining - c) (c :: current))
        (List.filteri (fun i _ -> i >= start) candidates)
  in
  backtrack 0 target [];
  !results

let () =
  let combos = combination_sum [ 2; 3; 6; 7 ] 7 in
  List.iter
    (fun combo ->
      List.iter (Printf.printf "%d ") combo;
      print_newline ())
    combos
