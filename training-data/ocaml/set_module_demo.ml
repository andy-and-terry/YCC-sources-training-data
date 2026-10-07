module IS = Set.Make (Int)

let () =
  let a = IS.of_list [ 1; 2; 3; 4 ] and b = IS.of_list [ 3; 4; 5 ] in
  let show name s =
    Printf.printf "%s: %s\n" name
      (String.concat " " (List.map string_of_int (IS.elements s)))
  in
  show "union" (IS.union a b);
  show "inter" (IS.inter a b);
  show "diff" (IS.diff a b);
  Printf.printf "subset: %b\n" (IS.subset (IS.inter a b) a)
