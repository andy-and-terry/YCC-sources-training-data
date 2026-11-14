val pairs = ListPair.zip ([1, 2, 3], ["a", "b", "c"])
val (ns, ss) = ListPair.unzip pairs
val _ = print (String.concat ss ^ Int.toString (foldl op+ 0 ns) ^ "\n")
