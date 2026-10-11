fun contains (needle, hay) = String.isSubstring needle hay

val text = "standard ml of new jersey"

val () = print (Bool.toString (contains ("new", text)) ^ "\n")
val () = print (Bool.toString (contains ("haskell", text)) ^ "\n")
val () = print (Bool.toString (String.isPrefix "standard" text) ^ "\n")
val () = print (Bool.toString (String.isSuffix "jersey" text) ^ "\n")
