fun secant f x0 x1 =
  let
    fun go 0 _ x1 = x1
      | go n x0 x1 =
          let
            val f0 = f x0
            val f1 = f x1
            val next = x1 - f1 * (x1 - x0) / (f1 - f0)
          in
            if Real.== (f0, f1) orelse Real.abs (next - x1) < 1E~12 then next
            else go (n - 1) x1 next
          end
  in
    go 50 x0 x1
  end

val () = print (Real.fmt (StringCvt.FIX (SOME 10)) (secant (fn x => x * x - 2.0) 1.0 2.0) ^ "\n")
