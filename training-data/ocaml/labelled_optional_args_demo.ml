let greet ?(greeting = "Hello") ~name ?punct () =
  let p = match punct with Some p -> p | None -> "!" in
  Printf.sprintf "%s, %s%s" greeting name p

let range ?(step = 1) lo hi =
  let rec go i acc = if i > hi then List.rev acc else go (i + step) (i :: acc) in
  go lo []

let () =
  print_endline (greet ~name:"Ann" ());
  print_endline (greet ~greeting:"Hi" ~name:"Bob" ~punct:"?" ());
  List.iter (Printf.printf "%d ") (range ~step:3 1 12);
  print_newline ()
