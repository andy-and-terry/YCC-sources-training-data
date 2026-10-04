let parse_age s =
  match int_of_string_opt s with
  | None -> Error ("not a number: " ^ s)
  | Some n when n < 0 -> Error "negative age"
  | Some n when n > 150 -> Error "unrealistic age"
  | Some n -> Ok n

let ( let* ) = Result.bind

let describe a b =
  let* x = parse_age a in
  let* y = parse_age b in
  Ok (x + y)

let () =
  List.iter
    (fun (a, b) ->
      match describe a b with
      | Ok total -> Printf.printf "%s+%s -> total %d\n" a b total
      | Error e -> Printf.printf "%s+%s -> error: %s\n" a b e)
    [ ("20", "30"); ("x", "5"); ("10", "-3"); ("200", "1") ]
