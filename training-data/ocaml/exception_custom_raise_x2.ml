exception Negative of int

let check n = if n < 0 then raise (Negative n) else n

let () =
  try ignore (check (-4)) with Negative n -> Printf.printf "neg %d\n" n
