let parse s = int_of_string_opt s
let ( let* ) = Option.bind

let add a b =
  let* x = parse a in
  let* y = parse b in
  Some (x + y)

let () =
  match add "3" "4", add "3" "z" with
  | Some n, None -> Printf.printf "%d none\n" n
  | _ -> print_endline "?"
