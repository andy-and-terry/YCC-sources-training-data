let table = [ ("one", 1); ("two", 2); ("three", 3) ]

let () =
  Printf.printf "two = %d\n" (List.assoc "two" table);
  (match List.assoc_opt "four" table with
   | Some v -> Printf.printf "four = %d\n" v
   | None -> print_endline "four missing");
  let updated = ("two", 22) :: List.remove_assoc "two" table in
  List.iter (fun (k, v) -> Printf.printf "%s=%d\n" k v) updated
