let parse_age s =
  match int_of_string_opt s with
  | None -> Error ("not a number: " ^ s)
  | Some n when n < 0 -> Error "negative age"
  | Some n when n > 150 -> Error "too old"
  | Some n -> Ok n

let describe n = if n >= 18 then Ok "adult" else Ok "minor"

let () =
  List.iter
    (fun s ->
      match Result.bind (parse_age s) describe with
      | Ok d -> Printf.printf "%s -> %s\n" s d
      | Error e -> Printf.printf "%s -> error: %s\n" s e)
    [ "30"; "12"; "-4"; "abc"; "200" ];
  let doubled = Result.map (fun x -> x * 2) (parse_age "21") in
  match doubled with Ok v -> Printf.printf "doubled: %d\n" v | Error e -> print_endline e
