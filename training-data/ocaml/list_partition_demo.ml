let () =
  let numbers = [ 1; 2; 3; 4; 5; 6; 7; 8; 9; 10 ] in
  let evens, odds = List.partition (fun n -> n mod 2 = 0) numbers in
  Printf.printf "evens: %s\n" (String.concat " " (List.map string_of_int evens));
  Printf.printf "odds: %s\n" (String.concat " " (List.map string_of_int odds));
  let names = [ "a"; "b"; "c" ] in
  let ages = [ 1; 2; 3 ] in
  let paired = List.combine names ages in
  List.iter (fun (name, age) -> Printf.printf "%s:%d\n" name age) paired;
  let names', ages' = List.split paired in
  Printf.printf "%s\n" (String.concat "," names');
  let total = List.fold_right ( + ) ages' 0 in
  Printf.printf "total age: %d\n" total
