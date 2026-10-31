fun isPowerful n =
  let
    fun strip m p = if m mod p = 0 then strip (m div p) p else m
    fun go m p =
      if p * p > m then m = 1
      else if m mod p = 0 then
        (if m mod (p * p) <> 0 then false else go (strip m p) (p + 1))
      else go m (p + 1)
  in
    go n 2
  end

fun range a b = if a > b then [] else a :: range (a + 1) b

val () = print (String.concatWith " " (map Int.toString (List.filter isPowerful (range 1 100))) ^ "\n")
