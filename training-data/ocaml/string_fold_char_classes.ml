let classify s =
  String.fold_left
    (fun (l, d, o) c ->
      match c with
      | 'a' .. 'z' | 'A' .. 'Z' -> (l + 1, d, o)
      | '0' .. '9' -> (l, d + 1, o)
      | _ -> (l, d, o + 1))
    (0, 0, 0) s

let () =
  let l, d, o = classify "Hello, World 2024!" in
  Printf.printf "letters=%d digits=%d other=%d\n" l d o
