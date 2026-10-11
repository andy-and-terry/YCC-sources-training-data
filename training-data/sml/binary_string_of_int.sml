fun toBinary 0 = "0"
  | toBinary n =
      let
        fun go (0, acc) = acc
          | go (m, acc) = go (m div 2, Int.toString (m mod 2) ^ acc)
      in
        go (n, "")
      end

val () = List.app (fn n => print (Int.toString n ^ " = " ^ toBinary n ^ "\n")) [0, 5, 10, 255]
val () = print (Int.fmt StringCvt.BIN 10 ^ "\n")
