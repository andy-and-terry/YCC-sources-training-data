(* explode: string -> char list, implode: char list -> string *)
val chars = String.explode "hello"
val _ = print (Int.toString (length chars) ^ "\n")

val upper = String.implode (map Char.toUpper chars)
val _ = print (upper ^ "\n")

fun isPalindrome s =
  let
    val cleaned = List.filter Char.isAlphaNum (String.explode (String.map Char.toLower s))
  in
    cleaned = List.rev cleaned
  end

val _ = print (Bool.toString (isPalindrome "A man, a plan, a canal: Panama") ^ "\n")

(* Remove vowels *)
fun isVowel c = Char.contains "aeiou" c
val noVowels = String.implode (List.filter (not o isVowel) (String.explode "education"))
val _ = print (noVowels ^ "\n")

(* concat / concatWith / str *)
val _ = print (String.concatWith "-" (map str chars) ^ "\n")
val _ = print (String.concat ["ab", "cd", "ef"] ^ "\n")
