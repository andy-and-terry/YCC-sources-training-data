(* Reverse-and-add until a palindrome; count the steps. *)
fun rev n =
  let
    val SOME r = Int.fromString (String.implode (List.rev (String.explode (Int.toString n))))
  in
    r
  end

fun steps start =
  let
    fun go (n, count) =
      if count > 0 andalso n = rev n then count
      else if count >= 50 then ~1
      else go (n + rev n, count + 1)
  in
    go (start, 0)
  end

val () = print (String.concatWith " " (map (Int.toString o steps) [56, 57, 59, 79, 89]) ^ "\n")
