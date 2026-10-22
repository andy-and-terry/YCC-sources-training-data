fun farey n =
  let
    fun go (a, b, c, d) =
      (print (Int.toString a ^ "/" ^ Int.toString b ^ " ");
       if a = 1 andalso b = 1 then ()
       else
         let val k = (n + b) div d
         in go (c, d, k * c - a, k * d - b) end)
  in
    go (0, 1, 1, n)
  end

val () = (farey 5; print "\n")
