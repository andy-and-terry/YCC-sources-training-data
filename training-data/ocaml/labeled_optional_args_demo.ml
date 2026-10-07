let greet ?(greeting = "Hello") ~name () = Printf.sprintf "%s, %s!" greeting name

let range ?(step = 1) lo hi =
  let rec go i acc = if i > hi then List.rev acc else go (i + step) (i :: acc) in
  go lo []

let clamp ~lo ~hi x = max lo (min hi x)

let () =
  print_endline (greet ~name:"Ada" ());
  print_endline (greet ~greeting:"Hi" ~name:"Bo" ());
  List.iter (Printf.printf "%d ") (range 1 10);
  print_newline ();
  List.iter (Printf.printf "%d ") (range ~step:3 0 12);
  print_newline ();
  let clamp_percent = clamp ~lo:0 ~hi:100 in
  Printf.printf "%d %d %d\n" (clamp_percent (-5)) (clamp_percent 50) (clamp_percent 250)
