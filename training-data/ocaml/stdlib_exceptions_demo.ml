let try_it name f =
  match f () with
  | v -> Printf.printf "%s: ok %d\n" name v
  | exception Not_found -> Printf.printf "%s: Not_found\n" name
  | exception Division_by_zero -> Printf.printf "%s: Division_by_zero\n" name
  | exception Invalid_argument m -> Printf.printf "%s: Invalid_argument %s\n" name m
  | exception Failure m -> Printf.printf "%s: Failure %s\n" name m

let () =
  try_it "assoc" (fun () -> List.assoc "z" [ ("a", 1) ]);
  try_it "div" (fun () -> 10 / (1 - 1));
  try_it "nth" (fun () -> List.nth [ 1; 2 ] 5);
  try_it "int_of_string" (fun () -> int_of_string "x1");
  try_it "hd" (fun () -> List.hd []);
  try_it "fine" (fun () -> 7)
