fun findIndex p xs =
  let
    fun go (_, []) = NONE
      | go (i, x :: rest) = if p x then SOME i else go (i + 1, rest)
  in
    go (0, xs)
  end

fun show NONE = "none"
  | show (SOME i) = Int.toString i

val () = print (show (findIndex (fn x => x > 10) [4, 8, 15, 16, 23]) ^ "\n")
val () = print (show (findIndex (fn x => x > 100) [4, 8, 15]) ^ "\n")
