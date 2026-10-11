fun splitOn c s = String.fields (fn x => x = c) s

val parts = splitOn #"," "a,b,,c,"
val () = print (Int.toString (length parts) ^ " fields\n")
val () = List.app (fn p => print ("[" ^ p ^ "]")) parts
val () = print "\n"

val nums = map (valOf o Int.fromString) (splitOn #";" "10;20;30")
val () = print (Int.toString (foldl op+ 0 nums) ^ "\n")
