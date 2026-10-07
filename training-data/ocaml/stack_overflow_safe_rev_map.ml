let map_tr f l = List.rev (List.rev_map f l)

let () =
  let big = List.init 1_000_000 Fun.id in
  let doubled = map_tr (fun x -> x * 2) big in
  Printf.printf "len=%d last=%d\n" (List.length doubled) (List.nth doubled 999_999)
