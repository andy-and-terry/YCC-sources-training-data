fun dropEvery (xs, step) =
  let
    fun go ([], _, acc) = rev acc
      | go (x :: rest, i, acc) =
          if i mod step = 0 then go (rest, i + 1, acc)
          else go (rest, i + 1, x :: acc)
  in
    go (xs, 1, [])
  end

fun lucky limit =
  let
    val odds = List.filter (fn x => x mod 2 = 1) (List.tabulate (limit, fn i => i + 1))
    fun sieve (xs, idx) =
      if idx >= length xs then xs
      else
        let val step = List.nth (xs, idx)
        in
          if step > length xs then xs
          else sieve (dropEvery (xs, step), idx + 1)
        end
  in
    sieve (odds, 1)
  end

val () =
  print (String.concatWith " " (map Int.toString (lucky 50)) ^ "\n")
