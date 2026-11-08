let rail_fence s rails =
  let rows = Array.make rails (Buffer.create 8) in
  Array.iteri (fun i _ -> rows.(i) <- Buffer.create 8) rows;
  let r = ref 0 and dir = ref 1 in
  String.iter (fun c ->
    Buffer.add_char rows.(!r) c;
    if !r = 0 then dir := 1;
    if !r = rails - 1 then dir := -1;
    r := !r + !dir) s;
  String.concat "" (Array.to_list (Array.map Buffer.contents rows))

let () = print_endline (rail_fence "WEAREDISCOVERED" 3)
