(* Primorials up to 1e6, including 1; expect 8. *)
fun isPrime n =
  let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1))
  in n > 1 andalso go 2 end
fun count lo hi pred = if lo > hi then 0 else (if pred lo then 1 else 0) + count (lo + 1) hi pred

fun primorials p acc n =
  if not (isPrime p) then primorials (p + 1) acc n
  else if acc * p > 1000000 then n
  else primorials (p + 1) (acc * p) (n + 1)
val _ = print (Int.toString (primorials 2 1 1) ^ "\n")
