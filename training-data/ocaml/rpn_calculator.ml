exception Invalid_expression of string

let eval tokens =
  let stack = Stack.create () in
  let apply op =
    let b = Stack.pop stack in
    let a = Stack.pop stack in
    match op with
    | "+" -> Stack.push (a +. b) stack
    | "-" -> Stack.push (a -. b) stack
    | "*" -> Stack.push (a *. b) stack
    | "/" -> Stack.push (a /. b) stack
    | _ -> raise (Invalid_expression op)
  in
  List.iter
    (fun token ->
      match float_of_string_opt token with
      | Some n -> Stack.push n stack
      | None -> apply token)
    tokens;
  Stack.pop stack

let () =
  Printf.printf "%.1f\n" (eval [ "3"; "4"; "+"; "2"; "*" ]);
  Printf.printf "%.1f\n" (eval [ "10"; "2"; "/"; "1"; "-" ])
