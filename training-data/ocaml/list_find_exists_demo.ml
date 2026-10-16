let () =
  let xs = [ 3; 8; 15; 22; 41 ] in
  Printf.printf "exists even: %b\n" (List.exists (fun x -> x mod 2 = 0) xs);
  Printf.printf "all positive: %b\n" (List.for_all (fun x -> x > 0) xs);
  Printf.printf "mem 15: %b\n" (List.mem 15 xs);
  (match List.find_opt (fun x -> x > 10) xs with
   | Some x -> Printf.printf "first > 10: %d\n" x
   | None -> print_endline "none");
  (match List.find_opt (fun x -> x > 100) xs with
   | Some x -> Printf.printf "first > 100: %d\n" x
   | None -> print_endline "none > 100");
  let rec index_of x i = function
    | [] -> -1
    | y :: rest -> if x = y then i else index_of x (i + 1) rest
  in
  Printf.printf "index of 22: %d\n" (index_of 22 0 xs);
  Printf.printf "length: %d, nth 2: %d\n" (List.length xs) (List.nth xs 2)
