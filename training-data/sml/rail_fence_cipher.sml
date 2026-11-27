fun encode text rails =
  let
    val period = 2 * (rails - 1)
    fun railOf i = let val m = i mod period in if m < rails then m else period - m end
    val keyed = ListPair.zip (List.tabulate (size text, fn i => (railOf i, i)), String.explode text)
    val sorted = ListSort.sort
      (fn (((r1, i1), _), ((r2, i2), _)) =>
         if r1 <> r2 then Int.compare (r1, r2) else Int.compare (i1, i2)) keyed
  in
    String.implode (map #2 sorted)
  end

val () = print (encode "WEAREDISCOVERED" 3 ^ "\n")
