let () =
  let s = Stack.create () in
  Stack.push 1 s;
  Stack.push 2 s;
  Stack.push 3 s;
  Printf.printf "size: %d, top: %d\n" (Stack.length s) (Stack.top s);
  while not (Stack.is_empty s) do
    Printf.printf "pop %d\n" (Stack.pop s)
  done;
  (try ignore (Stack.pop s) with Stack.Empty -> print_endline "stack empty");
  let balanced str =
    let st = Stack.create () in
    try
      String.iter
        (fun c ->
          match c with
          | '(' | '[' -> Stack.push c st
          | ')' -> if Stack.pop st <> '(' then raise Exit
          | ']' -> if Stack.pop st <> '[' then raise Exit
          | _ -> ())
        str;
      Stack.is_empty st
    with Exit | Stack.Empty -> false
  in
  Printf.printf "([])() balanced: %b, (] balanced: %b\n" (balanced "([])()") (balanced "(]")
