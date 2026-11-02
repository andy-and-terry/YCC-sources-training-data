type counter = { mutable n : int }

let () =
  let c = { n = 0 } in
  for _ = 1 to 5 do c.n <- c.n + 1 done;
  Printf.printf "%d\n" c.n
