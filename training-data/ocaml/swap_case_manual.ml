let swap_case s =
  String.map
    (fun c ->
      if c >= 'A' && c <= 'Z' then Char.lowercase_ascii c else Char.uppercase_ascii c)
    s

let () = print_endline (swap_case "Hello World 42")
