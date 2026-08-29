fun factorial n =
  let
    fun go (n, acc) = if n <= 1 then acc else go (n - 1, acc * n)
  in
    go (n, 1)
  end

val () = print (Int.toString (factorial 10) ^ "\n")
