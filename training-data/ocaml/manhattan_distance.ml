let manhattan a b = List.fold_left2 (fun s x y -> s + abs (x - y)) 0 a b

let () = Printf.printf "%d\n" (manhattan [1; 2] [4; 6])
