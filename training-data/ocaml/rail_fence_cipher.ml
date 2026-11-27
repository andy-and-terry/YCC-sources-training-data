let encode text rails =
  let rows = Array.init rails (fun _ -> Buffer.create 16) in
  let r = ref 0 and step = ref 1 in
  String.iter
    (fun ch ->
      Buffer.add_char rows.(!r) ch;
      if !r = 0 then step := 1 else if !r = rails - 1 then step := -1;
      r := !r + !step)
    text;
  String.concat "" (Array.to_list (Array.map Buffer.contents rows))

let () = print_endline (encode "WEAREDISCOVERED" 3)
