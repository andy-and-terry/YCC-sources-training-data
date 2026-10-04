let greet ?(greeting = "Hello") ?punct ~name () =
  let p = match punct with Some p -> p | None -> "!" in
  Printf.sprintf "%s, %s%s" greeting name p

let range ?(step = 1) ~lo ~hi () =
  let rec go acc i = if i > hi then List.rev acc else go (i :: acc) (i + step) in
  go [] lo

let rect ~width ~height = width * height

let () =
  print_endline (greet ~name:"Ada" ());
  print_endline (greet ~greeting:"Hi" ~punct:"?" ~name:"Bob" ());
  List.iter (Printf.printf "%d ") (range ~lo:1 ~hi:10 ~step:3 ());
  print_newline ();
  (* labelled args can be given in any order and partially applied *)
  let tall = rect ~height:10 in
  Printf.printf "%d %d\n" (rect ~height:2 ~width:3) (tall ~width:4);
  let sq = List.map (fun x -> rect ~width:x ~height:x) [ 1; 2; 3 ] in
  List.iter (Printf.printf "%d ") sq;
  print_newline ()
