fun safeDivide (a, 0) = NONE
  | safeDivide (a, b) = SOME (a div b)

val pairs = [(10, 2), (5, 0), (9, 3)]

val () =
  app
    (fn (a, b) =>
      case safeDivide (a, b) of
        SOME v => print (Int.toString a ^ " / " ^ Int.toString b ^ " = " ^ Int.toString v ^ "\n")
      | NONE => print (Int.toString a ^ " / " ^ Int.toString b ^ " = undefined\n"))
    pairs

val total = foldl (fn (x, acc) => x + acc) 0 (List.mapPartial (fn x => x) [SOME 1, NONE, SOME 3])
val () = print (Int.toString total ^ "\n")
