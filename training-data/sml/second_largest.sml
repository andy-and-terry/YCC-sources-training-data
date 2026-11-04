fun secondLargest xs =
  let
    fun step (x, (first, second)) =
      if x > first then (x, first)
      else if x > second andalso x <> first then (first, x)
      else (first, second)
    val (_, s) = foldl step (valOf Int.minInt, valOf Int.minInt) xs
  in s end

val () = print (Int.toString (secondLargest [4, 9, 2, 9, 7]) ^ "\n")
