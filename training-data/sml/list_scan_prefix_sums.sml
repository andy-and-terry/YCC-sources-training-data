fun scanl f init xs =
  let
    fun go (_, [], acc) = List.rev acc
      | go (s, x :: rest, acc) = let val s' = f (s, x) in go (s', rest, s' :: acc) end
  in
    init :: go (init, xs, [])
  end

val prefix = scanl op+ 0 [3, 1, 4, 1, 5]
val () = print (String.concatWith " " (map Int.toString prefix) ^ "\n")
