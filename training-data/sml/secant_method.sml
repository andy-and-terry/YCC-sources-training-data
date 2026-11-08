fun f x = x * x - 2.0

fun secant (a, b, 0) = b
  | secant (a, b, n) =
      if Real.== (f a, f b) then b
      else secant (b, b - f b * (b - a) / (f b - f a), n - 1)

val () = print (Real.fmt (StringCvt.FIX (SOME 8)) (secant (1.0, 2.0, 40)) ^ "\n")
