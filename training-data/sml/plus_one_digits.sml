fun plusOne digits =
  let
    val (carry, out) =
      foldr (fn (d, (c, acc)) => let val s = d + c in (s div 10, (s mod 10) :: acc) end)
            (1, []) digits
  in
    if carry > 0 then carry :: out else out
  end

fun show l = String.concatWith "," (map Int.toString l)
val _ = print (show (plusOne [1, 2, 9]) ^ "\n") (* 1,3,0 *)
val _ = print (show (plusOne [9, 9]) ^ "\n")    (* 1,0,0 *)
