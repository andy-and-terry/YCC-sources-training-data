exception Not_positive of int

let check n = if n <= 0 then raise (Not_positive n) else n

let () =
  try ignore (check (-3))
  with Not_positive n -> Printf.printf "bad: %d\n" n
