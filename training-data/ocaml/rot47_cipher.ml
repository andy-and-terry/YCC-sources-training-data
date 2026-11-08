let rot47 s =
  String.map (fun c ->
    let n = Char.code c in
    if n >= 33 && n <= 126 then Char.chr (33 + ((n - 33 + 47) mod 94)) else c) s

let () =
  let e = rot47 "Hello, World!" in
  print_endline e;
  print_endline (rot47 e)
