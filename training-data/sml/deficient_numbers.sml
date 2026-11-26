(* Deficient numbers below 100; expect 76. *)
fun properSum n =
  let fun go d t = if d >= n then t else go (d + 1) (if n mod d = 0 then t + d else t)
  in go 1 0 end
fun count lo hi pred = if lo > hi then 0 else (if pred lo then 1 else 0) + count (lo + 1) hi pred
val _ = print (Int.toString (count 1 99 (fn n => properSum n < n)) ^ "\n")
