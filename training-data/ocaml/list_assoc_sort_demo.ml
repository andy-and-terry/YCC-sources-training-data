let scores = [ ("ann", 82); ("bob", 95); ("cy", 82); ("dee", 70) ]

let () =
  Printf.printf "bob: %d\n" (List.assoc "bob" scores);
  Printf.printf "has eve: %b\n" (List.mem_assoc "eve" scores);
  let ranked =
    List.sort
      (fun (n1, s1) (n2, s2) ->
        match compare s2 s1 with 0 -> compare n1 n2 | c -> c)
      scores
  in
  List.iteri (fun i (n, s) -> Printf.printf "%d. %s %d\n" (i + 1) n s) ranked;
  let uniq = List.sort_uniq compare (List.map snd scores) in
  print_endline (String.concat "," (List.map string_of_int uniq))
