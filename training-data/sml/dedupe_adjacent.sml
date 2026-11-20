(* Remove consecutive duplicates. *)
fun dedupe (a :: (rest as b :: _)) = if a = b then dedupe rest else a :: dedupe rest
  | dedupe l = l
val _ = print (String.implode (dedupe (String.explode "aabbbcdd")) ^ "\n")
