let swap (a, b) = (b, a)

let min_max l =
  match l with
  | [] -> None
  | x :: rest ->
      Some (List.fold_left (fun (lo, hi) y -> (min lo y, max hi y)) (x, x) rest)

let () =
  let a, b = swap (1, "one") in
  Printf.printf "%s %d\n" a b;
  let x, y, z = (1, 2.5, "three") in
  Printf.printf "%d %.1f %s\n" x y z;
  (match min_max [ 5; 2; 9; 1; 7 ] with
   | Some (lo, hi) -> Printf.printf "min=%d max=%d\n" lo hi
   | None -> print_endline "empty");
  let _, snd_val = (10, 20) in
  Printf.printf "%d %d\n" (fst (3, 4)) snd_val
