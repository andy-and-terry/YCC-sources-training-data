type config = { host : string; port : int; debug : bool }

let default = { host = "localhost"; port = 8080; debug = false }

let () =
  let dev = { default with debug = true } in
  let prod = { default with host = "example.com"; port = 443 } in
  List.iter
    (fun c -> Printf.printf "%s:%d debug=%b\n" c.host c.port c.debug)
    [ default; dev; prod ]
