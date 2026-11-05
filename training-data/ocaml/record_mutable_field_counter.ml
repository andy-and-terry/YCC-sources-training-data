type counter = { mutable n : int; name : string }

let bump c = c.n <- c.n + 1

let () =
  let c = { n = 0; name = "hits" } in
  bump c; bump c;
  Printf.printf "%s=%d\n" c.name c.n
