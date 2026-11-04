let zigzag s rows =
  let n = String.length s in
  if rows = 1 || rows >= n then s
  else begin
    let lines = Array.init rows (fun _ -> Buffer.create 8) in
    let r = ref 0 and step = ref 1 in
    String.iter (fun c ->
      Buffer.add_char lines.(!r) c;
      if !r = 0 then step := 1 else if !r = rows - 1 then step := -1;
      r := !r + !step) s;
    String.concat "" (Array.to_list (Array.map Buffer.contents lines))
  end

let () = print_endline (zigzag "PAYPALISHIRING" 3)
