val counter = ref 0
fun next () = (counter := !counter + 1; !counter)
val _ = next ()
val _ = next ()
val _ = print (Int.toString (next ()) ^ "\n")
