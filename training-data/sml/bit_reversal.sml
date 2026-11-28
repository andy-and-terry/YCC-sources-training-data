fun reverseBits v =
  let
    fun go (0, _, acc) = acc
      | go (k, x, acc) = go (k - 1, x div 2, acc * 2 + x mod 2)
  in go (8, v, 0) end

val _ = app (fn v => print (Int.toString v ^ " " ^ Int.toString (reverseBits v) ^ "\n"))
            [1, 6, 13, 128]
(* 128 96 176 1 *)
