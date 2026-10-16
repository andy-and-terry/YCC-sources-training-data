let compose f g x = f (g x)
let ( >> ) f g x = g (f x)

let add n x = x + n
let double x = x * 2

let rec repeat n f x = if n = 0 then x else repeat (n - 1) f (f x)

let () =
  let inc_then_double = add 1 >> double in
  let double_then_inc = compose (add 1) double in
  Printf.printf "%d %d\n" (inc_then_double 5) (double_then_inc 5);
  Printf.printf "repeat double 10 on 1 = %d\n" (repeat 10 double 1);
  let pipeline = List.fold_left ( >> ) Fun.id [ add 3; double; add (-1) ] in
  Printf.printf "pipeline 4 = %d\n" (pipeline 4)
