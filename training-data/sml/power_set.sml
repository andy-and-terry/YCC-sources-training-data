fun powerSet [] = [[]]
  | powerSet (x :: xs) =
      let val rest = powerSet xs in
        rest @ map (fn s => x :: s) rest
      end

val () =
  app
    (fn s => print ("{" ^ String.concatWith "," (map Int.toString s) ^ "}\n"))
    (powerSet [1, 2, 3])
