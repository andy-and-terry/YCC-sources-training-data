val fact = Vector.fromList [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

fun isFactorion n =
  let
    fun go 0 acc = acc
      | go m acc = go (m div 10) (acc + Vector.sub (fact, m mod 10))
  in
    go n 0 = n
  end

fun range a b = if a > b then [] else a :: range (a + 1) b

val () = print (String.concatWith " " (map Int.toString (List.filter isFactorion (range 1 49999))) ^ "\n")
