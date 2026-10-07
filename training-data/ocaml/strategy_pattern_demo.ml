(* In OCaml, "strategy" objects are just functions passed around and
   stored in records: no interface/class hierarchy is needed since
   functions are already first-class values. *)
type discount_strategy = float -> float

let no_discount : discount_strategy = fun price -> price

let percent_off (percent : float) : discount_strategy =
 fun price -> price -. (price *. (percent /. 100.0))

let flat_off (amount : float) : discount_strategy = fun price -> Float.max 0.0 (price -. amount)

type cart = { strategy : discount_strategy }

let checkout cart price = cart.strategy price

let () =
  let regular = { strategy = no_discount } in
  let sale = { strategy = percent_off 20.0 } in
  let coupon = { strategy = flat_off 5.0 } in
  Printf.printf "%.2f\n" (checkout regular 100.0);
  Printf.printf "%.2f\n" (checkout sale 100.0);
  Printf.printf "%.2f\n" (checkout coupon 100.0)
