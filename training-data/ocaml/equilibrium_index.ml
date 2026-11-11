let equilibrium_index nums =
  let total = List.fold_left ( + ) 0 nums in
  let rec go i left = function
    | [] -> -1
    | v :: rest -> if left = total - left - v then i else go (i + 1) (left + v) rest
  in
  go 0 0 nums

let () = Printf.printf "%d\n" (equilibrium_index [ 1; 7; 3; 6; 5; 6 ]) (* 3 *)
