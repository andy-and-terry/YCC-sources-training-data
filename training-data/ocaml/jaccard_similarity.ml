module IS = Set.Make (Int)

let jaccard a b =
  let a = IS.of_list a and b = IS.of_list b in
  let u = IS.cardinal (IS.union a b) in
  if u = 0 then 1.0 else float_of_int (IS.cardinal (IS.inter a b)) /. float_of_int u

let () = Printf.printf "%.2f\n" (jaccard [1; 2; 3; 4] [3; 4; 5])
