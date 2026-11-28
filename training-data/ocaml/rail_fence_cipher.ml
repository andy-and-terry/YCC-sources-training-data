let order n k =
  let cycle = 2 * (k - 1) in
  let rail i = let r = i mod cycle in if r < k then r else cycle - r in
  List.init n (fun i -> (rail i, i)) |> List.sort compare |> List.map snd

let encrypt t k =
  String.init (String.length t) (fun p -> t.[List.nth (order (String.length t) k) p])

let decrypt c k =
  let out = Bytes.make (String.length c) ' ' in
  List.iteri (fun pos i -> Bytes.set out i c.[pos]) (order (String.length c) k);
  Bytes.to_string out

let () =
  let c = encrypt "WEAREDISCOVERED" 3 in
  Printf.printf "%s %s\n" c (decrypt c 3)
