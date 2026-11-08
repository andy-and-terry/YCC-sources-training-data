fun area pts =
  let
    val next = tl pts @ [hd pts]
    val s = ListPair.foldl (fn ((x1, y1), (x2, y2), acc) => acc + x1 * y2 - x2 * y1) 0.0 (pts, next)
  in Real.abs s / 2.0 end

val () = print (Real.toString (area [(0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0)]) ^ "\n")
