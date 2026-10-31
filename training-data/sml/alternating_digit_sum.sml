fun alternatingDigitSum n =
  let
    fun go 0 _ acc = acc
      | go m sign acc = go (m div 10) (~sign) (acc + sign * (m mod 10))
  in
    go n 1 0
  end

val () = List.app (fn n =>
  print (Int.toString n ^ " " ^ Int.toString (alternatingDigitSum n) ^ "\n")) [1234, 99999, 1000]
