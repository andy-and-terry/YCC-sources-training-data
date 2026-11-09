type counter = { mutable n : int }

let incr c = c.n <- c.n + 1

let () =
  let c = { n = 0 } in
  incr c; incr c;
  Printf.printf "%d\n" c.n
