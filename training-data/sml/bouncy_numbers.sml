(* Count bouncy numbers (neither increasing nor decreasing digits) below 1000. *)
fun isBouncy n =
  let
    val d = String.explode (Int.toString n)
    fun monotone cmp (a :: (rest as b :: _)) = cmp (a, b) andalso monotone cmp rest
      | monotone _ _ = true
  in
    not (monotone (fn (a, b) => a <= b) d) andalso not (monotone (fn (a, b) => a >= b) d)
  end

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val () = print (Int.toString (length (List.filter isBouncy (range (1, 999)))) ^ "\n")
