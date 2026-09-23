(* `result` threads an error value through a computation instead of
   raising, and `bind` (aliased `>>=`) chains fallible steps together,
   short-circuiting on the first `Error`. *)
let ( >>= ) r f = match r with Ok v -> f v | Error e -> Error e

let parse_int s = try Ok (int_of_string s) with Failure _ -> Error (Printf.sprintf "not a number: %s" s)

let safe_divide a b = if b = 0 then Error "division by zero" else Ok (a / b)

let compute a_str b_str = parse_int a_str >>= fun a -> parse_int b_str >>= fun b -> safe_divide a b

let () =
  List.iter
    (fun (a, b) ->
      match compute a b with
      | Ok v -> Printf.printf "%s / %s = %d\n" a b v
      | Error msg -> Printf.printf "%s / %s -> error: %s\n" a b msg)
    [ ("10", "2"); ("7", "0"); ("x", "3") ]
