fun maxArea hs =
  let
    val v = Vector.fromList hs
    fun go (lo, hi, best) =
      if lo >= hi then best
      else
        let
          val a = Vector.sub (v, lo)
          val b = Vector.sub (v, hi)
          val best' = Int.max (best, Int.min (a, b) * (hi - lo))
        in
          if a < b then go (lo + 1, hi, best') else go (lo, hi - 1, best')
        end
  in
    go (0, Vector.length v - 1, 0)
  end

val _ = print (Int.toString (maxArea [1, 8, 6, 2, 5, 4, 8, 3, 7]) ^ "\n") (* 49 *)
