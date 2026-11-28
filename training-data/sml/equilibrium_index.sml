fun equilibriumIndex nums =
  let
    val total = foldl op+ 0 nums
    fun go (_, _, []) = ~1
      | go (i, left, v :: rest) =
          if left = total - left - v then i else go (i + 1, left + v, rest)
  in
    go (0, 0, nums)
  end

val _ = print (Int.toString (equilibriumIndex [1, 7, 3, 6, 5, 6]) ^ "\n") (* 3 *)
