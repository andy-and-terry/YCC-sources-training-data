fun memoize f =
  let
    val cache : (int * int) list ref = ref []
  in
    fn n =>
      case List.find (fn (k, _) => k = n) (!cache) of
        SOME (_, v) => v
      | NONE =>
          let val v = f n
          in cache := (n, v) :: !cache; v end
  end

val calls = ref 0
val slowSquare = memoize (fn n => (calls := !calls + 1; n * n))

val _ = slowSquare 4
val _ = slowSquare 4
val _ = slowSquare 5
val () = print ("underlying calls: " ^ Int.toString (!calls) ^ "\n")
