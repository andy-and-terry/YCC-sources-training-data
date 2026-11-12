val s = "hello"
val r = String.implode (rev (String.explode s))
val _ = print (r ^ " " ^ Int.toString (size s) ^ "\n")
