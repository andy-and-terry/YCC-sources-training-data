fun rod_cutting (prices, n) =
  let
    val dp = Array.array (n + 1, 0)
    fun best len =
      let
        fun try_cut (cut, acc) =
          if cut > len then acc
          else
            let
              val revenue = List.nth (prices, cut - 1) + Array.sub (dp, len - cut)
            in
              try_cut (cut + 1, Int.max (acc, revenue))
            end
      in
        try_cut (1, 0)
      end
    fun loop len =
      if len > n then ()
      else (Array.update (dp, len, best len); loop (len + 1))
    val () = loop 1
  in
    Array.sub (dp, n)
  end

val () = print (Int.toString (rod_cutting ([1, 5, 8, 9, 10, 17, 17, 20], 8)) ^ "\n")
