let join sep items =
  let b = Buffer.create 64 in
  List.iteri
    (fun i s ->
      if i > 0 then Buffer.add_string b sep;
      Buffer.add_string b s)
    items;
  Buffer.contents b

let () =
  print_endline (join ", " [ "alpha"; "beta"; "gamma" ]);
  print_endline (String.concat "|" [ "x"; "y" ])
