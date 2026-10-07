let make_counter () =
  let n = ref 0 in
  fun () ->
    incr n;
    !n

let () =
  let a = make_counter () and b = make_counter () in
  ignore (a ());
  ignore (a ());
  Printf.printf "a=%d b=%d\n" (a ()) (b ())
