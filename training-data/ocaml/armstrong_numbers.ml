let rec pow b e = if e = 0 then 1 else b * pow b (e - 1)

let digits n = String.to_seq (string_of_int n) |> List.of_seq |> List.map (fun c -> Char.code c - 48)

let is_armstrong n =
  let ds = digits n in
  let len = List.length ds in
  List.fold_left (fun acc d -> acc + pow d len) 0 ds = n

let () =
  for n = 1 to 999 do
    if is_armstrong n then Printf.printf "%d " n
  done;
  print_newline () (* 1..9 153 370 371 407 *)
