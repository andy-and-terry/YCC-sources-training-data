module IntSet = Set.Make (Int)
let () =
  let s = IntSet.of_list [3; 1; 2; 3] in
  Printf.printf "%d %b\n" (IntSet.cardinal s) (IntSet.mem 2 s)
