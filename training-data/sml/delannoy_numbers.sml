fun delannoy size =
  let
    val t = Array2.array (size, size, 1)
    val idx = List.tabulate (size - 1, fn i => i + 1)
    fun at (m, n) = Array2.sub (t, m, n)
  in
    List.app (fn m =>
      List.app (fn n =>
        Array2.update (t, m, n, at (m - 1, n) + at (m, n - 1) + at (m - 1, n - 1)))
        idx)
      idx;
    List.tabulate (size, fn k => at (k, k))
  end

val () =
  print (String.concatWith " " (map Int.toString (delannoy 10)) ^ "\n")
