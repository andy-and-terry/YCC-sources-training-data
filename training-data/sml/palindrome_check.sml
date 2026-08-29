fun is_palindrome s =
  let
    val normalized = String.implode (List.filter Char.isAlphaNum (String.explode (String.map Char.toLower s)))
    val reversed = String.implode (rev (String.explode normalized))
  in
    normalized = reversed
  end

val () = print (Bool.toString (is_palindrome "A man, a plan, a canal: Panama") ^ "\n")
val () = print (Bool.toString (is_palindrome "hello") ^ "\n")
