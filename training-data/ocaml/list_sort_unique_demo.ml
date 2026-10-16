let () =
  let words = [ "pear"; "apple"; "fig"; "apple"; "pear"; "kiwi" ] in
  let sorted = List.sort compare words in
  print_endline (String.concat " " sorted);
  let uniq = List.sort_uniq compare words in
  print_endline (String.concat " " uniq);
  let by_length = List.sort (fun a b ->
    let c = compare (String.length a) (String.length b) in
    if c <> 0 then c else compare a b) uniq in
  print_endline (String.concat " " by_length);
  let desc = List.sort (fun a b -> compare b a) [ 3; 1; 4; 1; 5; 9; 2; 6 ] in
  print_endline (String.concat " " (List.map string_of_int desc))
