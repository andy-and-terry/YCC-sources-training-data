val t = (1, "two", 3.0, #"4")

val a = #1 t
val b = #2 t
val c = #3 t
val d = #4 t

val () = print (Int.toString a ^ " " ^ b ^ " " ^ Real.toString c ^ " " ^ str d ^ "\n")

val r = {name = "ml", year = 1973}
val () = print (#name r ^ " " ^ Int.toString (#year r) ^ "\n")
