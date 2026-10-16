let rec powerset = function
  | [] -> [ [] ]
  | x :: rest ->
      let sub = powerset rest in
      sub @ List.map (fun s -> x :: s) sub

let () =
  let sets = powerset [ 'a'; 'b'; 'c' ] in
  List.iter
    (fun s ->
      let str = String.concat "" (List.map (String.make 1) s) in
      Printf.printf "{%s}\n" str)
    sets;
  Printf.printf "count: %d\n" (List.length sets)
