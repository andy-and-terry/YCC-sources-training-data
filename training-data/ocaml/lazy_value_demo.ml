let expensive = lazy (print_endline "computing..."; 6 * 7)

let () =
  print_endline "before";
  Printf.printf "first: %d\n" (Lazy.force expensive);
  Printf.printf "second: %d\n" (Lazy.force expensive);
  Printf.printf "forced? %b\n" (Lazy.is_val expensive)
