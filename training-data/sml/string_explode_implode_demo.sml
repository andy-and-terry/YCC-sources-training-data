fun reverseString s = String.implode (List.rev (String.explode s))
fun isPalindrome s = s = reverseString s

val () = print (reverseString "hello" ^ "\n")
val () = print (Bool.toString (isPalindrome "level") ^ "\n")
val () = print (String.map Char.toUpper "shout" ^ "\n")
val () = print (String.concatWith "-" (String.tokens (fn c => c = #" ") "a b  c") ^ "\n")
val () = print (Int.toString (size (String.substring ("abcdef", 1, 3))) ^ "\n")
val () = print (String.translate (fn c => if c = #"a" then "4" else str c) "banana" ^ "\n")
