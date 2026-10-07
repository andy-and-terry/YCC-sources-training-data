let table = [ ("apple", 3); ("pear", 5); ("fig", 9) ]

let () =
  Printf.printf "pear=%d\n" (List.assoc "pear" table);
  (match List.assoc_opt "kiwi" table with
  | Some n -> Printf.printf "kiwi=%d\n" n
  | None -> print_endline "kiwi missing");
  Printf.printf "has fig: %b\n" (List.mem_assoc "fig" table);
  let t2 = List.remove_assoc "apple" table in
  Printf.printf "len=%d\n" (List.length t2);
  List.iter (fun (k, v) -> Printf.printf "%s:%d " k v) (List.sort compare t2);
  print_newline ()
