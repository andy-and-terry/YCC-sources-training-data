let bwt s =
  let n = String.length s in
  let rots = List.init n (fun i -> String.sub s i (n - i) ^ String.sub s 0 i) in
  let sorted = List.sort compare rots in
  String.concat "" (List.map (fun r -> String.make 1 r.[n - 1]) sorted)

let () = print_endline (bwt "banana$")
