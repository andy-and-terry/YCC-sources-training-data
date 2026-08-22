type point = { x : real, y : real }

fun addPoints (a : point, b : point) : point =
  { x = #x a + #x b, y = #y a + #y b }

val () =
  let
    val p1 = { x = 1.0, y = 2.0 }
    val p2 = { x = 3.0, y = 4.0 }
    val p3 = addPoints (p1, p2)
  in
    print (Real.toString (#x p3) ^ " " ^ Real.toString (#y p3) ^ "\n")
  end
