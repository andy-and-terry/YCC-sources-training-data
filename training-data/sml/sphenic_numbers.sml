fun isSphenic n =
  let
    fun go m p distinct =
      if p * p > m then distinct + (if m > 1 then 1 else 0) = 3
      else if m mod p = 0 then
        let val m' = m div p
        in if m' mod p = 0 then false else go m' (p + 1) (distinct + 1) end
      else go m (p + 1) distinct
  in
    go n 2 0
  end

fun range a b = if a > b then [] else a :: range (a + 1) b

val () = print (String.concatWith " " (map Int.toString (List.filter isSphenic (range 2 79))) ^ "\n")
