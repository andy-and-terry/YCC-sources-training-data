fun ways (terms, c) =
  length (List.filter
    (fn x => 2 * x < c andalso List.exists (fn y => y = c - x) terms)
    terms)

fun ulam count =
  let
    fun go (terms, c) =
      if length terms >= count then terms
      else if ways (terms, c) = 1 then go (terms @ [c], c + 1)
      else go (terms, c + 1)
  in
    go ([1, 2], 3)
  end

val () =
  print (String.concatWith " " (map Int.toString (ulam 15)) ^ "\n")
