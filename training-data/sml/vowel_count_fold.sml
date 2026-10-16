fun isVowel c = Char.contains "aeiou" (Char.toLower c)

fun countVowels s =
  List.foldl (fn (c, n) => if isVowel c then n + 1 else n) 0 (String.explode s)

val () = print (Int.toString (countVowels "Standard ML Programming") ^ "\n")
val () = print (Int.toString (countVowels "rhythm") ^ "\n")
