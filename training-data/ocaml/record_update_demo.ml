type config = { host : string; port : int; verbose : bool }

let default = { host = "localhost"; port = 80; verbose = false }

let show c = Printf.printf "%s:%d verbose=%b\n" c.host c.port c.verbose

let () =
  show default;
  let dev = { default with port = 3000; verbose = true } in
  show dev;
  let prod = { dev with host = "example.org"; verbose = false } in
  show prod;
  Printf.printf "default unchanged: %b\n" (default.port = 80);
  let { host; port; _ } = prod in
  Printf.printf "destructured %s %d\n" host port
