let safe_div a b = if b = 0 then None else Some (a / b)

let ( >>= ) o f = match o with None -> None | Some x -> f x

let () =
  let show = function Some n -> string_of_int n | None -> "none" in
  print_endline (show (safe_div 10 2));
  print_endline (show (safe_div 10 0));
  print_endline (show (safe_div 100 5 >>= fun x -> safe_div x 2));
  print_endline (show (safe_div 100 0 >>= fun x -> safe_div x 2));
  print_endline (show (Option.map (fun x -> x + 1) (Some 41)));
  Printf.printf "%d\n" (Option.value (safe_div 1 0) ~default:(-1));
  Printf.printf "is_some: %b is_none: %b\n" (Option.is_some (Some 1)) (Option.is_none (Some 1))
