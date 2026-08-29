fun two_sum (nums, target) =
  let
    fun go ([], _, _) = NONE
      | go (n :: rest, i, seen) =
          let val complement = target - n in
            case List.find (fn (v, _) => v = complement) seen of
              SOME (_, j) => SOME (j, i)
            | NONE => go (rest, i + 1, (n, i) :: seen)
          end
  in
    go (nums, 0, [])
  end

val () =
  case two_sum ([2, 7, 11, 15], 9) of
    SOME (i, j) => print (Int.toString i ^ " " ^ Int.toString j ^ "\n")
  | NONE => print "none\n"
