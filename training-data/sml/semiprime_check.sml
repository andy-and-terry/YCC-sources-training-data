fun primeFactorCount n =
  let
    fun go m p count =
      if p * p > m then (if m > 1 then count + 1 else count)
      else if m mod p = 0 then go (m div p) p (count + 1)
      else go m (p + 1) count
  in
    go n 2 0
  end

fun range a b = if a > b then [] else a :: range (a + 1) b

val () = print (String.concatWith " " (map Int.toString
  (List.filter (fn n => primeFactorCount n = 2) (range 2 29))) ^ "\n")
