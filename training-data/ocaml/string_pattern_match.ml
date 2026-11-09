let describe = function
  | "" -> "empty"
  | s when String.length s = 1 -> "single"
  | s -> "string of " ^ string_of_int (String.length s)

let () = List.iter (fun s -> print_endline (describe s)) [""; "a"; "hello"]
