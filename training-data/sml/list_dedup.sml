fun member (x, []) = false
  | member (x, y :: ys) = x = y orelse member (x, ys)

fun dedup xs =
  let
    fun go ([], seen) = List.rev seen
      | go (x :: rest, seen) =
          if member (x, seen) then go (rest, seen) else go (rest, x :: seen)
  in
    go (xs, [])
  end

val () = print (String.concatWith " " (map Int.toString (dedup [3,1,3,2,1,4,2])) ^ "\n")
