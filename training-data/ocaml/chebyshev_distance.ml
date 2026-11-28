let chebyshev a b = List.fold_left2 (fun m x y -> max m (abs (x - y))) 0 a b

let () = Printf.printf "%d\n" (chebyshev [1; 2] [4; 6])
