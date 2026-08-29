fun binary_search_recursive (arr, target) =
  let
    fun go (low, high) =
      if low > high then ~1
      else
        let val mid = (low + high) div 2 in
          if Array.sub (arr, mid) = target then mid
          else if Array.sub (arr, mid) < target then go (mid + 1, high)
          else go (low, mid - 1)
        end
  in
    go (0, Array.length arr - 1)
  end

val data = Array.fromList [1, 3, 5, 7, 9, 11]
val () = print (Int.toString (binary_search_recursive (data, 7)) ^ "\n")
