let rec interleave a b =
  match (a, b) with
  | [], l | l, [] -> l
  | x :: xs, y :: ys -> x :: y :: interleave xs ys

let rec intersperse sep = function
  | [] -> []
  | [ x ] -> [ x ]
  | x :: rest -> x :: sep :: intersperse sep rest

let () =
  let r = interleave [ 1; 3; 5; 7 ] [ 2; 4 ] in
  print_endline (String.concat " " (List.map string_of_int r));
  let s = intersperse "," [ "a"; "b"; "c" ] in
  print_endline (String.concat "" s)
