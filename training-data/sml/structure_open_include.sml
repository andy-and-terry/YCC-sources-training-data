structure Geometry =
struct
  val pi = 3.14159
  fun circleArea r = pi * r * r
  fun squareArea s = s * s
end

local
  open Geometry
in
  val a = circleArea 2.0
  val b = squareArea 3.0
end

val () = print (Real.toString a ^ "\n")
val () = print (Real.toString b ^ "\n")
