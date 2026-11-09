let safe_div a b = if b = 0 then Error "div by zero" else Ok (a / b)

let () =
  match safe_div 10 2 with
  | Ok v -> Printf.printf "ok %d\n" v
  | Error e -> print_endline e;
  match safe_div 1 0 with
  | Ok v -> Printf.printf "ok %d\n" v
  | Error e -> print_endline e
