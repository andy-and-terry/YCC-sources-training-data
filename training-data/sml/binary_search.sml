fun binarySearch (arr, target) =
  let
    fun go (low, high) =
      if low > high then ~1
      else
        let
          val mid = (low + high) div 2
          val value = Array.sub (arr, mid)
        in
          if value = target then mid
          else if value < target then go (mid + 1, high)
          else go (low, mid - 1)
        end
  in
    go (0, Array.length arr - 1)
  end

val sorted = Array.fromList [1, 3, 5, 7, 9, 11, 13]
val () = print (Int.toString (binarySearch (sorted, 7)) ^ "\n")
val () = print (Int.toString (binarySearch (sorted, 4)) ^ "\n")
