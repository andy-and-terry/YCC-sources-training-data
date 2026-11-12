fun find (x, []) = NONE
  | find (x, (k, v) :: t) = if x = k then SOME v else find (x, t)
val r = find ("b", [("a", 1), ("b", 2)])
val _ = print (case r of SOME n => Int.toString n | NONE => "none")
