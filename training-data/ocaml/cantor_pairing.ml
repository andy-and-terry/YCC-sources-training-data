(* Cantor pairing function and its inverse. *)
let pair x y = (x + y) * (x + y + 1) / 2 + y

let unpair z =
  let w = (int_of_float (sqrt (float_of_int (8 * z + 1))) - 1) / 2 in
  let y = z - w * (w + 1) / 2 in
  (w - y, y)

let () =
  Printf.printf "%d\n" (pair 3 4);
  let x, y = unpair 32 in
  Printf.printf "%d %d\n" x y
