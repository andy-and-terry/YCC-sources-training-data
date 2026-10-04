type error = Empty | NotNumber of string | Negative of int

let parse s =
  if s = "" then Error Empty
  else
    match int_of_string_opt s with
    | None -> Error (NotNumber s)
    | Some n when n < 0 -> Error (Negative n)
    | Some n -> Ok n

let describe = function
  | Ok n -> Printf.sprintf "ok %d" n
  | Error Empty -> "error: empty input"
  | Error (NotNumber s) -> Printf.sprintf "error: %S is not a number" s
  | Error (Negative n) -> Printf.sprintf "error: %d is negative" n

let sum_all inputs =
  List.fold_left
    (fun acc s -> Result.bind acc (fun total -> Result.map (( + ) total) (parse s)))
    (Ok 0) inputs

let () =
  List.iter (fun s -> print_endline (describe (parse s))) [ "42"; ""; "x1"; "-5" ];
  print_endline (describe (sum_all [ "1"; "2"; "3" ]));
  print_endline (describe (sum_all [ "1"; "oops"; "3" ]))
