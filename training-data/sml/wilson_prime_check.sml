(* Wilson's theorem primality test. *)
fun wilson n =
  n >= 2 andalso
  let fun go i f = if i >= n then f else go (i + 1) (f * i mod n) in go 2 1 end = n - 1
val _ = List.app (fn n => if wilson n then print (Int.toString n ^ " ") else ()) (List.tabulate (18, fn i => i + 2))
val _ = print "\n"
