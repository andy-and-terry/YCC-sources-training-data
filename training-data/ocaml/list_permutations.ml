let rec insert_everywhere x = function
  | [] -> [ [ x ] ]
  | y :: rest as l ->
      (x :: l) :: List.map (fun p -> y :: p) (insert_everywhere x rest)

let rec permutations = function
  | [] -> [ [] ]
  | x :: rest -> List.concat_map (insert_everywhere x) (permutations rest)

let () =
  let perms = permutations [ 1; 2; 3 ] in
  List.iter (fun p -> print_endline (String.concat "" (List.map string_of_int p))) perms;
  Printf.printf "total: %d\n" (List.length perms)
