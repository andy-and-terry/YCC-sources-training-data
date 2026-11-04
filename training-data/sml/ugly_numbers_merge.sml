fun ugly n =
  let
    fun nth (xs, i) = List.nth (xs, i)
    fun go (seq, i2, i3, i5) =
      if length seq >= n then nth (seq, n - 1)
      else
        let
          val c2 = 2 * nth (seq, i2)
          val c3 = 3 * nth (seq, i3)
          val c5 = 5 * nth (seq, i5)
          val next = Int.min (c2, Int.min (c3, c5))
        in
          go (seq @ [next],
              if next = c2 then i2 + 1 else i2,
              if next = c3 then i3 + 1 else i3,
              if next = c5 then i5 + 1 else i5)
        end
  in go ([1], 0, 0, 0) end

val () = print (String.concatWith " " (List.tabulate (12, fn i => Int.toString (ugly (i + 1)))) ^ "\n")
