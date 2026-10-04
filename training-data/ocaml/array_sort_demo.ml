type person = { name : string; age : int }

let people =
  [| { name = "Dan"; age = 30 }; { name = "Ann"; age = 25 };
     { name = "Bob"; age = 30 }; { name = "Eve"; age = 25 } |]

let show arr =
  Array.iter (fun p -> Printf.printf "%s(%d) " p.name p.age) arr;
  print_newline ()

let () =
  let by_age = Array.copy people in
  Array.stable_sort (fun a b -> compare a.age b.age) by_age;
  show by_age;
  let by_name = Array.copy people in
  Array.sort (fun a b -> String.compare a.name b.name) by_name;
  show by_name;
  let nums = [| 5; 3; 9; 1; 7 |] in
  Array.sort (fun a b -> compare b a) nums;
  Array.iter (Printf.printf "%d ") nums;
  print_newline ();
  let sum = Array.fold_left ( + ) 0 nums in
  Printf.printf "sum=%d max=%d\n" sum (Array.fold_left max min_int nums);
  Array.iteri (fun i x -> nums.(i) <- x * 2) nums;
  Printf.printf "%s\n" (String.concat "," (Array.to_list (Array.map string_of_int nums)))
