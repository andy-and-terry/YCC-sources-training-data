datatype shape =
    Circle of real
  | Rectangle of real * real
  | Triangle of real * real

fun area (Circle r) = Math.pi * r * r
  | area (Rectangle (w, h)) = w * h
  | area (Triangle (b, h)) = 0.5 * b * h

val () =
  app
    (fn s => print (Real.toString (area s) ^ "\n"))
    [Circle 2.0, Rectangle (3.0, 4.0), Triangle (6.0, 2.0)]
