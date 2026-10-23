fun ulam count =
  let
    fun ways (cand, terms) =
      length (List.filter
        (fn x => x * 2 < cand andalso List.exists (fn y => y = cand - x) terms)
        terms)
    fun go (cand, acc, n) =
      if n >= count then rev acc
      else if ways (cand, acc) = 1 then go (cand + 1, cand :: acc, n + 1)
      else go (cand + 1, acc, n)
  in
    go (3, [2, 1], 2)
  end

val () =
  print (String.concatWith " " (map Int.toString (ulam 15)) ^ "\n")
