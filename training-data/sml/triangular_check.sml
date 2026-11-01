(* n is triangular iff 8n + 1 is a perfect square. *)
fun isTriangular n =
  let
    val s = 8 * n + 1
    val r = Real.round (Math.sqrt (Real.fromInt s))
  in
    r * r = s
  end

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val () = print (String.concatWith " " (map Int.toString (List.filter isTriangular (range (0, 20)))) ^ "\n")
