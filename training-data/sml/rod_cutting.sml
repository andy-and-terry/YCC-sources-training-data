fun rod_cutting (prices, length) =
  let
    val dp = Array.array (length + 1, 0)
    fun best_for len =
      let
        fun loop (cut, acc) =
          if cut > len then acc
          else
            let
              val candidate = List.nth (prices, cut - 1) + Array.sub (dp, len - cut)
            in
              loop (cut + 1, Int.max (acc, candidate))
            end
      in
        loop (1, 0)
      end
    fun fill len =
      if len > length then ()
      else (Array.update (dp, len, best_for len); fill (len + 1))
    val () = fill 1
  in
    Array.sub (dp, length)
  end

val prices = [1, 5, 8, 9, 10, 17, 17, 20]
val () = print (Int.toString (rod_cutting (prices, List.length prices)) ^ "\n")
