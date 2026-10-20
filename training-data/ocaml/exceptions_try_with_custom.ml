exception Not_positive of int
exception Parse_error of string * int

let check n = if n <= 0 then raise (Not_positive n) else n

let () =
  (try ignore (check (-3)) with Not_positive n -> Printf.printf "not positive %d\n" n);
  (try ignore (List.hd []) with Failure m -> Printf.printf "failure %s\n" m);
  (try ignore (1 / 0) with Division_by_zero -> print_endline "div0");
  (try raise (Parse_error ("bad", 7)) with Parse_error (m, l) -> Printf.printf "%s@%d\n" m l);
  (try ignore (Hashtbl.find (Hashtbl.create 1) "k") with Not_found -> print_endline "nf");
  let r = try int_of_string "x" with Failure _ -> -1 in
  Printf.printf "%d\n" r;
  (try failwith "boom" with Failure m -> print_endline m | _ -> ());
  match (try Ok (check 5) with e -> Error e) with Ok v -> Printf.printf "%d\n" v | Error _ -> ()
