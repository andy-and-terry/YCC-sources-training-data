fun isPronic x =
  let val n = Real.floor (Math.sqrt (Real.fromInt x))
  in n * (n + 1) = x end

val firstTen = List.tabulate (10, fn n => n * (n + 1))
val _ = print (String.concatWith " " (map Int.toString firstTen) ^ "\n")
(* 0 2 6 12 20 30 42 56 72 90 *)
val _ = print (Bool.toString (isPronic 56) ^ " " ^ Bool.toString (isPronic 57) ^ "\n")
(* true false *)
