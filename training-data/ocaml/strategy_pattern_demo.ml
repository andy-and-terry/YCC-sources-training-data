type strategy = int array -> int array

let ascending : strategy =
 fun arr ->
  Array.sort compare arr;
  arr

let descending : strategy =
 fun arr ->
  Array.sort (fun a b -> compare b a) arr;
  arr

let apply_strategy (strategy : strategy) (arr : int array) = strategy (Array.copy arr)

let () =
  let data = [| 5; 2; 9; 1; 5; 6 |] in
  let asc = apply_strategy ascending data in
  Printf.printf "ascending: %s\n"
    (String.concat " " (Array.to_list (Array.map string_of_int asc)));
  let desc = apply_strategy descending data in
  Printf.printf "descending: %s\n"
    (String.concat " " (Array.to_list (Array.map string_of_int desc)))
