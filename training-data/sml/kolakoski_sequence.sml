fun kolakoski n =
  let
    val a = Array.array (n + 3, 0)
    val () = (Array.update (a, 0, 1); Array.update (a, 1, 2); Array.update (a, 2, 2))
    fun put (0, w, _) = w
      | put (k, w, v) = (Array.update (a, w, v); put (k - 1, w + 1, v))
    fun go (w, r, v) =
      if w >= n then ()
      else go (put (Array.sub (a, r), w, v), r + 1, 3 - v)
  in
    go (3, 2, 1);
    List.tabulate (n, fn i => Array.sub (a, i))
  end

val () =
  print (String.concatWith " " (map Int.toString (kolakoski 20)) ^ "\n")
