let parse s =
  match int_of_string_opt s with
  | Some n -> Printf.sprintf "%S -> %d" s n
  | None -> Printf.sprintf "%S -> not an int" s

let () =
  List.iter (fun s -> print_endline (parse s)) [ "42"; "-7"; "0x1F"; "abc"; "3.5"; "" ];
  (match float_of_string_opt "2.5e3" with
   | Some f -> Printf.printf "float: %.1f\n" f
   | None -> print_endline "bad float");
  Printf.printf "bool: %b\n" (bool_of_string "true");
  Printf.printf "string_of_float: %s\n" (string_of_float 1.5)
