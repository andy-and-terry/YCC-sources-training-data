let parse_int s =
  match int_of_string_opt s with
  | Some n -> Ok n
  | None -> Error (Printf.sprintf "not a number: %S" s)

let safe_div a b = if b = 0 then Error "division by zero" else Ok (a / b)

let compute a b =
  Result.bind (parse_int a) (fun x ->
    Result.bind (parse_int b) (fun y -> safe_div x y))

let show = function
  | Ok n -> Printf.printf "ok %d\n" n
  | Error e -> Printf.printf "error: %s\n" e

let () =
  show (compute "84" "2");
  show (compute "84" "0");
  show (compute "x" "2")
