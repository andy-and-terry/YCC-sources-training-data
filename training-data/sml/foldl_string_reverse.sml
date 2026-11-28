val rev = foldl (op ::) []
val _ = print (implode (rev (explode "hello")) ^ "\n")
