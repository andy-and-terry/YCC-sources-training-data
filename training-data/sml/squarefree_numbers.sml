(* Squarefree numbers up to 100; expect 61. *)
fun squarefree n =
  let fun go d = d * d > n orelse (n mod (d * d) <> 0 andalso go (d + 1))
  in go 2 end
fun count lo hi pred = if lo > hi then 0 else (if pred lo then 1 else 0) + count (lo + 1) hi pred
val _ = print (Int.toString (count 1 100 squarefree) ^ "\n")
