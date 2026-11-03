fun digitSquareSum n =
  let
    fun go 0 acc = acc
      | go m acc = go (m div 10) (acc + (m mod 10) * (m mod 10))
  in
    go (abs n) 0
  end

val () = print (Int.toString (digitSquareSum 123) ^ "\n")
val () = print (Int.toString (digitSquareSum ~99) ^ "\n")
