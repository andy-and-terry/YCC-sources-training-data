let safe_div a b = if b = 0 then None else Some (a / b)

let parse s = match int_of_string_opt s with Some n -> Ok n | None -> Error ("bad: " ^ s)

let ( >>= ) r f = match r with Ok x -> f x | Error _ as e -> e

let () =
  let r = parse "10" >>= fun a -> parse "2" >>= fun b -> Ok (a / b) in
  (match r with Ok v -> Printf.printf "ok %d\n" v | Error e -> print_endline e);
  (match parse "x" >>= fun a -> Ok a with Ok _ -> () | Error e -> print_endline e);
  Printf.printf "%s\n" (match Option.bind (safe_div 6 3) (fun x -> safe_div x 0) with None -> "none" | Some x -> string_of_int x);
  Printf.printf "%d\n" (Option.value ~default:0 (Option.map (fun x -> x * 2) (Some 4)))
