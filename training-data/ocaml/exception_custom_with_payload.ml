exception Bad_input of string * int

let check n = if n < 0 then raise (Bad_input ("negative", n)) else n

let () =
  try ignore (check (-4))
  with Bad_input (msg, v) -> Printf.printf "%s: %d\n" msg v
