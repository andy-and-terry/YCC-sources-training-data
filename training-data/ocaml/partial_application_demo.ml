let volume l w h = l * w * h

let () =
  let with_length_2 = volume 2 in
  let with_2_by_3 = with_length_2 3 in
  Printf.printf "%d\n" (with_2_by_3 4);
  let adders = List.map (fun n -> ( + ) n) [ 1; 10; 100 ] in
  List.iter (fun f -> Printf.printf "%d " (f 5)) adders;
  print_newline ();
  let flip f a b = f b a in
  let minus_from = flip ( - ) in
  Printf.printf "%d\n" (minus_from 3 10);
  let curry f a b = f (a, b) and uncurry f (a, b) = f a b in
  Printf.printf "%d %d\n" (curry fst 1 2) (uncurry ( * ) (6, 7))
