let parse_int s =
  match int_of_string_opt s with
  | Some n -> Ok n
  | None -> Error ("not a number: " ^ s)

let safe_div a b = if b = 0 then Error "division by zero" else Ok (a / b)

let ( let* ) = Result.bind

let compute a b =
  let* x = parse_int a in
  let* y = parse_int b in
  safe_div x y

let show = function
  | Ok v -> Printf.sprintf "ok %d" v
  | Error e -> "error: " ^ e

let () =
  List.iter (fun (a, b) -> print_endline (show (compute a b)))
    [ ("10", "2"); ("10", "0"); ("x", "1") ]
