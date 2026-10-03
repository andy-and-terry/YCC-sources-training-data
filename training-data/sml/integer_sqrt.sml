(* Integer square root via binary search: largest r such that
   r * r <= n. *)
fun isqrt n =
  let
    fun go (lo, hi, best) =
      if lo > hi then best
      else
        let
          val mid = (lo + hi) div 2
        in
          if mid * mid <= n then go (mid + 1, hi, mid)
          else go (lo, mid - 1, best)
        end
  in
    go (0, n, 0)
  end

val () =
  app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (isqrt n) ^ "\n"))
    [0, 1, 4, 15, 16, 99, 100, 1000000]
