let is_self_describing s =
  let len = String.length s in
  let count c = String.fold_left (fun acc x -> if x = c then acc + 1 else acc) 0 s in
  let rec go i =
    i >= len
    || (count (Char.chr (Char.code '0' + i)) = Char.code s.[i] - Char.code '0' && go (i + 1))
  in
  go 0

let () =
  List.iter
    (fun s -> Printf.printf "%s %b\n" s (is_self_describing s))
    [ "1210"; "2020"; "21200"; "1211" ]
