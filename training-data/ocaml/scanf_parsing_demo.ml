let parse_point s = Scanf.sscanf s "(%d, %d)" (fun x y -> (x, y))

let parse_kv s = Scanf.sscanf s "%[^=]=%s" (fun k v -> (k, v))

let parse_date s = Scanf.sscanf s "%4d-%2d-%2d" (fun y m d -> (y, m, d))

let () =
  let x, y = parse_point "(3, -7)" in
  Printf.printf "point: %d %d\n" x y;
  let k, v = parse_kv "colour=blue" in
  Printf.printf "%s -> %s\n" k v;
  let y, m, d = parse_date "2024-03-15" in
  Printf.printf "%02d/%02d/%d\n" d m y;
  (match Scanf.sscanf "12 apples" "%d %s" (fun n w -> (n, w)) with
   | n, w -> Printf.printf "%d of %s\n" n w);
  try ignore (parse_point "oops")
  with Scanf.Scan_failure msg | Failure msg -> Printf.printf "parse failed: %s\n" msg
