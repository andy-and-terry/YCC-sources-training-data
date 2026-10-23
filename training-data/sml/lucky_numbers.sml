fun dropEvery k xs =
  let
    fun go (_, []) = []
      | go (i, y :: ys) =
          if i = k then go (1, ys) else y :: go (i + 1, ys)
  in
    go (1, xs)
  end

fun lucky limit =
  let
    val odds = List.tabulate (limit div 2, fn i => 2 * i + 1)
    fun sieve (xs, idx) =
      if idx >= length xs then xs
      else
        let val k = List.nth (xs, idx)
        in
          if k > length xs then xs else sieve (dropEvery k xs, idx + 1)
        end
  in
    sieve (odds, 1)
  end

val () =
  print (String.concatWith " " (map Int.toString (lucky 100)) ^ "\n")
