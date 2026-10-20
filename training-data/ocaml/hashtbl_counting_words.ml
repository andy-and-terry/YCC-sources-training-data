let () =
  let text = "the cat and the dog and the bird" in
  let tbl = Hashtbl.create 16 in
  List.iter
    (fun w ->
      let c = try Hashtbl.find tbl w with Not_found -> 0 in
      Hashtbl.replace tbl w (c + 1))
    (String.split_on_char ' ' text);
  let items = Hashtbl.fold (fun k v acc -> (k, v) :: acc) tbl [] in
  let sorted = List.sort (fun (a, x) (b, y) -> if x <> y then compare y x else compare a b) items in
  List.iter (fun (w, c) -> Printf.printf "%s=%d " w c) sorted;
  print_newline ();
  Printf.printf "%b %d\n" (Hashtbl.mem tbl "cat") (Hashtbl.length tbl)
