let expensive =
  lazy
    (print_endline "computing...";
     List.fold_left ( + ) 0 (List.init 100 (fun i -> i)))

let () =
  print_endline "before";
  Printf.printf "first: %d\n" (Lazy.force expensive);
  Printf.printf "second: %d\n" (Lazy.force expensive);
  Printf.printf "is_val: %b\n" (Lazy.is_val expensive)
