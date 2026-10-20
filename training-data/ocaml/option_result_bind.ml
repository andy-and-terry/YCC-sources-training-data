let parse s = match int_of_string_opt s with Some n -> Ok n | None -> Error ("bad " ^ s)
let ( let* ) = Result.bind

let sum a b =
  let* x = parse a in
  let* y = parse b in
  Ok (x + y)

let () =
  match sum "1" "2" with Ok n -> print_int n | Error e -> print_string e
