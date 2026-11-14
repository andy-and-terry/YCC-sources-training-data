let ( let* ) = Result.bind

let div a b = if b = 0 then Error "div0" else Ok (a / b)

let () =
  let r = let* x = div 100 5 in let* y = div x 2 in Ok (x + y) in
  match r with Ok v -> Printf.printf "%d\n" v | Error e -> print_endline e
