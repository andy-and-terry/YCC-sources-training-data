val pairs = ListPair.zip ([1, 2, 3], ["a", "b", "c"])
val (ns, ss) = ListPair.unzip pairs
val _ = print (String.concat ss ^ "\n")
val _ = print (Int.toString (length ns) ^ "\n")
