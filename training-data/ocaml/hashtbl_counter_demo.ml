let count_chars s =
  let tbl = Hashtbl.create 16 in
  String.iter
    (fun c ->
      let n = try Hashtbl.find tbl c with Not_found -> 0 in
      Hashtbl.replace tbl c (n + 1))
    s;
  tbl

let () =
  let tbl = count_chars "mississippi" in
  let pairs = Hashtbl.fold (fun c n acc -> (c, n) :: acc) tbl [] in
  let sorted = List.sort (fun (c1, n1) (c2, n2) -> if n1 <> n2 then compare n2 n1 else compare c1 c2) pairs in
  List.iter (fun (c, n) -> Printf.printf "%c: %d\n" c n) sorted;
  Printf.printf "distinct = %d\n" (Hashtbl.length tbl);
  Printf.printf "has 'z'? %b\n" (Hashtbl.mem tbl 'z');
  Hashtbl.remove tbl 'm';
  Printf.printf "after remove = %d\n" (Hashtbl.length tbl)
