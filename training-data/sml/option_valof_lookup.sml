fun lookup k [] = NONE
  | lookup k ((k', v) :: t) = if k = k' then SOME v else lookup k t

val env = [("a", 1), ("b", 2)]
val _ = print (Int.toString (getOpt (lookup "b" env, 0)) ^ "\n")
val _ = print (Int.toString (getOpt (lookup "z" env, ~1)) ^ "\n")
