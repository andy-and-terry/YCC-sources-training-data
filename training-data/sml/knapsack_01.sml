fun knapsack (weights, values, capacity) =
  let
    val dp = Array.array (capacity + 1, 0)
    fun processItem (w, v) =
      let
        fun loop cap =
          if cap < w then ()
          else
            (Array.update (dp, cap, Int.max (Array.sub (dp, cap), Array.sub (dp, cap - w) + v));
             loop (cap - 1))
      in
        loop capacity
      end
    val () = ListPair.app processItem (weights, values)
  in
    Array.sub (dp, capacity)
  end

val () = print (Int.toString (knapsack ([2, 3, 4, 5], [3, 4, 5, 6], 5)) ^ "\n")
