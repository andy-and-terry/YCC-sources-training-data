exception Parse_error of int * string
exception Out_of_stock of { item : string; wanted : int; have : int }

let () =
  Printexc.register_printer (function
    | Parse_error (line, msg) ->
        Some (Printf.sprintf "parse error at line %d: %s" line msg)
    | Out_of_stock { item; wanted; have } ->
        Some (Printf.sprintf "out of stock: %s (wanted %d, have %d)" item wanted have)
    | _ -> None)

let attempt name f =
  match f () with
  | v -> Printf.printf "%s -> %d\n" name v
  | exception e -> Printf.printf "%s raised: %s\n" name (Printexc.to_string e)

let () =
  attempt "ok" (fun () -> 42);
  attempt "parse" (fun () -> raise (Parse_error (7, "unexpected token")));
  attempt "stock" (fun () -> raise (Out_of_stock { item = "widget"; wanted = 5; have = 2 }));
  attempt "builtin" (fun () -> List.assoc "x" []);
  attempt "div" (fun () -> 1 / List.length []);
  attempt "failwith" (fun () -> failwith "custom failure");
  attempt "invalid" (fun () -> invalid_arg "bad argument")
