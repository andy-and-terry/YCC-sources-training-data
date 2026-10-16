module IS = Set.Make (Int)

let show s = print_endline (String.concat " " (List.map string_of_int (IS.elements s)))

let () =
  let a = IS.of_list [ 1; 2; 3; 4; 5 ] in
  let b = IS.of_list [ 4; 5; 6; 7 ] in
  show (IS.union a b);
  show (IS.inter a b);
  show (IS.diff a b);
  Printf.printf "subset: %b\n" (IS.subset (IS.of_list [ 2; 3 ]) a);
  Printf.printf "mem 6 in a: %b\n" (IS.mem 6 a);
  Printf.printf "cardinal: %d min: %d max: %d\n" (IS.cardinal a) (IS.min_elt a) (IS.max_elt a);
  let evens, odds = IS.partition (fun x -> x mod 2 = 0) a in
  show evens;
  show odds
