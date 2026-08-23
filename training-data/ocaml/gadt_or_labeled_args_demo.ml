let greet ?(greeting = "Hello") ~name = Printf.sprintf "%s, %s!" greeting name

let () =
  print_endline (greet ~name:"World");
  print_endline (greet ~greeting:"Hi" ~name:"World")
