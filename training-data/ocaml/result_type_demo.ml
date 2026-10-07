let safe_div a b = if b = 0 then Error "division by zero" else Ok (a / b)

let ( let* ) = Result.bind

let compute a b c =
  let* x = safe_div a b in
  let* y = safe_div x c in
  Ok (x + y)

let show = function
  | Ok v -> Printf.printf "ok %d\n" v
  | Error e -> Printf.printf "error: %s\n" e

let () =
  show (compute 100 5 2);
  show (compute 1 0 2);
  show (compute 10 2 0)
