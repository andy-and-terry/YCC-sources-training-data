let ages = [ ("alice", 30); ("bob", 25); ("carol", 41) ]

let () =
  (match List.assoc_opt "bob" ages with
   | Some a -> Printf.printf "bob is %d\n" a
   | None -> print_endline "bob unknown");
  Printf.printf "dave known: %b\n" (List.mem_assoc "dave" ages);
  let older = List.map (fun (n, a) -> (n, a + 1)) ages in
  let without_bob = List.remove_assoc "bob" older in
  List.iter (fun (n, a) -> Printf.printf "%s=%d\n" n a) without_bob;
  let names, nums = List.split ages in
  Printf.printf "%s | %d\n" (String.concat "," names) (List.fold_left ( + ) 0 nums)
