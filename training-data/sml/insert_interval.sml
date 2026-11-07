fun insertInterval ([], (lo, hi)) = [(lo, hi)]
  | insertInterval ((l, h) :: rest, (lo, hi)) =
      if h < lo then (l, h) :: insertInterval (rest, (lo, hi))
      else if l > hi then (lo, hi) :: (l, h) :: rest
      else insertInterval (rest, (Int.min (lo, l), Int.max (hi, h)))

fun show (a, b) = "(" ^ Int.toString a ^ "," ^ Int.toString b ^ ")"
val _ = print (String.concatWith " " (map show (insertInterval ([(1, 3), (6, 9)], (2, 5)))) ^ "\n")
(* (1,5) (6,9) *)
