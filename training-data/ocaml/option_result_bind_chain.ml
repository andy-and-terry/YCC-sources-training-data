let ( >>= ) r f = match r with Ok x -> f x | Error _ as e -> e

let parse s = match int_of_string_opt s with Some n -> Ok n | None -> Error ("bad " ^ s)
let positive n = if n > 0 then Ok n else Error "not positive"

let () =
  List.iter
    (fun s ->
      match parse s >>= positive with
      | Ok n -> Printf.printf "ok %d\n" n
      | Error e -> Printf.printf "error %s\n" e)
    [ "5"; "-3"; "x" ]
