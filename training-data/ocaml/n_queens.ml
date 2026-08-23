let is_safe queens col =
  let n = List.length queens in
  List.for_all
    (fun (q, i) ->
      let dist = n - i in
      q <> col && abs (q - col) <> dist)
    (List.mapi (fun i q -> (q, i)) queens)

let rec solve queens n =
  if List.length queens = n then 1
  else
    List.fold_left
      (fun acc col -> if is_safe queens col then acc + solve (queens @ [ col ]) n else acc)
      0
      (List.init n (fun i -> i))

let () = print_int (solve [] 6); print_newline ()
