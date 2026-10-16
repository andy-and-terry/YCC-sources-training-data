fun integrate (f, a, b, n) =
  let
    val h = (b - a) / Real.fromInt n
    fun go (i, acc) =
      if i >= n then acc
      else go (i + 1, acc + f (a + Real.fromInt i * h))
  in
    h * ((f a + f b) / 2.0 + go (1, 0.0))
  end

val area = integrate (fn x => x * x, 0.0, 3.0, 1000)
val () = print (Real.fmt (StringCvt.FIX (SOME 4)) area ^ "\n")
