let parse s = int_of_string_opt s
let half n = if n mod 2 = 0 then Some (n / 2) else None

let () =
  let show = function Some n -> string_of_int n | None -> "none" in
  List.iter (fun s -> print_endline (show (Option.bind (parse s) half))) [ "8"; "7"; "x" ]
