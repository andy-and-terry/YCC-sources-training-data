fun find (x, []) = NONE
  | find (x, (k, v) :: rest) = if x = k then SOME v else find (x, rest)

val table = [("a", 1), ("b", 2)]
val () = print (Int.toString (getOpt (find ("a", table), 0)) ^ "\n")
val () = print (Int.toString (getOpt (find ("z", table), ~1)) ^ "\n")
val () = print (Bool.toString (isSome (find ("b", table))) ^ "\n")
val () = print (Int.toString (valOf (find ("b", table))) ^ "\n")
val mapped = Option.map (fn n => n * 10) (find ("b", table))
val () = print (Int.toString (getOpt (mapped, 0)) ^ "\n")
