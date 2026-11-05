fun makeCounter () =
  let val n = ref 0
  in fn () => (n := !n + 1; !n) end

val c = makeCounter ()
val _ = c ()
val _ = c ()
val _ = print (Int.toString (c ()) ^ "\n")
