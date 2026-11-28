let four_sum_count a b c d =
  let sums = Hashtbl.create 16 in
  List.iter
    (fun x ->
      List.iter
        (fun y ->
          let k = x + y in
          Hashtbl.replace sums k (1 + try Hashtbl.find sums k with Not_found -> 0))
        b)
    a;
  List.fold_left
    (fun acc x ->
      List.fold_left
        (fun acc y -> acc + try Hashtbl.find sums (-(x + y)) with Not_found -> 0)
        acc d)
    0 c

let () = Printf.printf "%d\n" (four_sum_count [ 1; 2 ] [ -2; -1 ] [ -1; 2 ] [ 0; 2 ]) (* 2 *)
