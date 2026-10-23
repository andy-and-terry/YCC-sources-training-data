(* String.collate compares strings with a custom character ordering. *)
fun ci_char_compare (a, b) =
  Char.compare (Char.toLower a, Char.toLower b)

val ci_compare = String.collate ci_char_compare

fun show LESS = "LESS"
  | show EQUAL = "EQUAL"
  | show GREATER = "GREATER"

val () = print (show (String.compare ("Apple", "apple")) ^ "\n")
val () = print (show (ci_compare ("Apple", "apple")) ^ "\n")
val () = print (show (ci_compare ("apple", "banana")) ^ "\n")
val () = print (show (ci_compare ("Zebra", "apple")) ^ "\n")

val words = ["pear", "Apple", "cherry", "banana"]
fun insert (x, []) = [x]
  | insert (x, y :: ys) =
      if ci_compare (x, y) = GREATER then y :: insert (x, ys) else x :: y :: ys

val sorted = List.foldl insert [] words
val () = print (String.concatWith " " sorted ^ "\n")
