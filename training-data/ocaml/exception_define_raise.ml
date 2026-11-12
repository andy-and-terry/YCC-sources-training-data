exception Empty_stack of string
let pop = function [] -> raise (Empty_stack "pop") | _ :: t -> t
let () = try ignore (pop []) with Empty_stack m -> Printf.printf "caught %s\n" m
