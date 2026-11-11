(* Highest value reached by the Collatz (hailstone) sequence from n. *)
let peak n =
  let rec go n best =
    if n = 1 then best
    else
      let next = if n mod 2 = 0 then n / 2 else (3 * n) + 1 in
      go next (max best next)
  in
  go n n

let () = Printf.printf "%d\n" (peak 27)
