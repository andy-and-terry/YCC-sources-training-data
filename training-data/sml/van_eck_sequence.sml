fun vanEck count =
  let
    fun dist (x, earlier) =
      let
        fun go (_, []) = 0
          | go (d, y :: rest) = if y = x then d else go (d + 1, rest)
      in
        go (1, earlier)
      end
    fun step (n, acc) =
      if n >= count then rev acc
      else
        case acc of
          x :: earlier => step (n + 1, dist (x, earlier) :: acc)
        | [] => []
  in
    step (1, [0])
  end

val () =
  print (String.concatWith " " (map Int.toString (vanEck 20)) ^ "\n")
