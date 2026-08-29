fun min_coins (coins, amount) =
  let
    val dp = Array.array (amount + 1, ~1)
    val () = Array.update (dp, 0, 0)
    fun loop n =
      if n > amount then ()
      else
        let
          fun tryCoin c =
            if c <= n andalso Array.sub (dp, n - c) <> ~1 then
              let val candidate = Array.sub (dp, n - c) + 1 in
                if Array.sub (dp, n) = ~1 orelse candidate < Array.sub (dp, n) then
                  Array.update (dp, n, candidate)
                else ()
              end
            else ()
          val () = List.app tryCoin coins
        in
          loop (n + 1)
        end
    val () = loop 1
  in
    Array.sub (dp, amount)
  end

val () = print (Int.toString (min_coins ([1, 2, 5], 11)) ^ "\n")
