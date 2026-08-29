datatype shape = Circle of real | Rectangle of real * real | Triangle of real * real * real

fun area (Circle r) = Math.pi * r * r
  | area (Rectangle (w, h)) = w * h
  | area (Triangle (a, b, c)) =
      let val s = (a + b + c) / 2.0 in
        Math.sqrt (s * (s - a) * (s - b) * (s - c))
      end

val () = print (Real.toString (area (Circle 4.0)) ^ "\n")
val () = print (Real.toString (area (Rectangle (3.0, 5.0))) ^ "\n")
