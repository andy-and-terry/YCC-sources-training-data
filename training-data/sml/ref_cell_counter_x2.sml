val c = ref 0
fun tick () = (c := !c + 1; !c)
val _ = (tick (); tick (); print (Int.toString (tick ()) ^ "\n"))
