fun reverseWords s =
  let
    val words = String.tokens Char.isSpace s
  in
    String.concatWith " " (List.rev words)
  end

val () = print (reverseWords "the quick brown fox" ^ "\n")
val () = print (reverseWords "  spaced   out  " ^ "\n")
