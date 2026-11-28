fun windowHash s i k =
  let
    fun go j h = if j = i + k then h
                 else go (j + 1) ((h * 31 + Char.ord (String.sub (s, j))) mod 1000003)
  in go i 0 end

val s = "abcabc"
val () = List.app (fn i => print (Int.toString i ^ " " ^ Int.toString (windowHash s i 3) ^ "\n"))
                  (List.tabulate (String.size s - 2, fn i => i))
