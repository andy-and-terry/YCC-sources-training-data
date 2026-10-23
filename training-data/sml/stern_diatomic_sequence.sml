fun stern 0 = 0
  | stern 1 = 1
  | stern n =
      if n mod 2 = 0 then stern (n div 2)
      else stern (n div 2) + stern (n div 2 + 1)

val () =
  print (String.concatWith " " (map Int.toString (List.tabulate (20, stern))) ^ "\n")
