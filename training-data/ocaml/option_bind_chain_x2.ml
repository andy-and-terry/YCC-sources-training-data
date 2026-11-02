let ( >>= ) = Option.bind
let half n = if n mod 2 = 0 then Some (n / 2) else None

let () =
  match Some 20 >>= half >>= half with
  | Some n -> Printf.printf "%d\n" n
  | None -> print_endline "none"
