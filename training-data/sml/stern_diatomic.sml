fun stern 0 = 0
  | stern 1 = 1
  | stern i =
      if i mod 2 = 0 then stern (i div 2)
      else stern (i div 2) + stern (i div 2 + 1)

val seq = List.tabulate (15, stern)
val _ = print (String.concatWith " " (map Int.toString seq) ^ "\n")
(* 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 *)
