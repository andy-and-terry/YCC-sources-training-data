val tri = List.tabulate (10, fn i => (i + 1) * (i + 2) div 2)

val () = print (String.concatWith " " (map Int.toString tri) ^ "\n")
