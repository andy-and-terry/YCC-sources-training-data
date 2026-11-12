val c = ref 0
fun inc () = (c := !c + 1; !c)
val _ = inc (); val _ = inc ()
val _ = print (Int.toString (!c) ^ "\n")
