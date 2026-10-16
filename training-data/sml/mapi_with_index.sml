val names = ["ann", "bob", "cy"]

val numbered = List.mapi (fn (i, n) => Int.toString (i + 1) ^ ". " ^ n) names

val () = List.app (fn s => print (s ^ "\n")) numbered
val () = List.appi (fn (i, n) => print (Int.toString i ^ ":" ^ n ^ " ")) names
val () = print "\n"
