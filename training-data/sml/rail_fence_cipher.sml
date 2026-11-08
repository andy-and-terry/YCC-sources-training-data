fun rail i rails =
  let val p = 2 * (rails - 1)
      val m = i mod p
  in if m < rails then m else p - m end

fun encode s rails =
  let
    val tagged = List.tabulate (size s, fn i => (rail i rails, i, String.sub (s, i)))
    fun row r = List.filter (fn (x, _, _) => x = r) tagged
    val all = List.concat (List.tabulate (rails, row))
  in String.implode (map (fn (_, _, c) => c) all) end

val () = print (encode "WEAREDISCOVERED" 3 ^ "\n")
