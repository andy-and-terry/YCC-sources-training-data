let expensive =
  lazy
    (print_endline "computing...";
     List.fold_left ( + ) 0 (List.init 100 succ))

let () =
  print_endline "before";
  Printf.printf "%d\n" (Lazy.force expensive);
  Printf.printf "%d\n" (Lazy.force expensive);
  Printf.printf "forced: %b\n" (Lazy.is_val expensive)
