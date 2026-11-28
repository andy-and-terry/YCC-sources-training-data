fun rail (i, k) =
  let
    val cycle = 2 * (k - 1)
    val r = i mod cycle
  in
    if r < k then r else cycle - r
  end

fun encrypt (text, k) =
  let
    val chars = String.explode text
    val indexed = ListPair.zip (List.tabulate (length chars, fn i => i), chars)
    fun forRail r = List.filter (fn (i, _) => rail (i, k) = r) indexed
    val all = List.concat (List.tabulate (k, forRail))
  in
    String.implode (map #2 all)
  end

val () = print (encrypt ("WEAREDISCOVERED", 3) ^ "\n")
