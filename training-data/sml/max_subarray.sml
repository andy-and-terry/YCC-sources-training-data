fun kadane (h :: t) =
      let
        fun helper ([], _, best) = best
          | helper (x :: xs, current, best) =
              let
                val newCurrent = Int.max (x, current + x)
                val newBest = Int.max (best, newCurrent)
              in
                helper (xs, newCurrent, newBest)
              end
      in
        helper (t, h, h)
      end
  | kadane [] = 0

val () = print (Int.toString (kadane [~2, 1, ~3, 4, ~1, 2, 1, ~5, 4]) ^ "\n")
