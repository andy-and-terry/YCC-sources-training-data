fun fletcher16 s =
  let
    val (s1, s2) =
      foldl (fn (c, (a, b)) =>
               let val a' = (a + Char.ord c) mod 255 in (a', (b + a') mod 255) end)
            (0, 0) (String.explode s)
  in
    s2 * 256 + s1
  end

val () = print (Int.fmt StringCvt.HEX (fletcher16 "abcde") ^ "\n")
