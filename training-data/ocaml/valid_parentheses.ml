let is_valid s =
  let stack = ref [] in
  let valid = ref true in
  String.iter
    (fun c ->
      if !valid then
        match c with
        | '(' | '[' | '{' -> stack := c :: !stack
        | ')' -> (
            match !stack with
            | '(' :: rest -> stack := rest
            | _ -> valid := false)
        | ']' -> (
            match !stack with
            | '[' :: rest -> stack := rest
            | _ -> valid := false)
        | '}' -> (
            match !stack with
            | '{' :: rest -> stack := rest
            | _ -> valid := false)
        | _ -> ())
    s;
  !valid && !stack = []

let () =
  print_endline (string_of_bool (is_valid "{[()]}"));
  print_endline (string_of_bool (is_valid "{[(])}"))
