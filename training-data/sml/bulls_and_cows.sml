(* Bulls and Cows scoring for equal-length digit strings. *)
fun removeFirst _ [] = []
  | removeFirst x (y :: ys) = if x = y then ys else y :: removeFirst x ys

fun score secret guess =
  let
    val pairs = ListPair.zip (String.explode secret, String.explode guess)
    val bulls = length (List.filter (fn (s, g) => s = g) pairs)
    val rest = List.filter (fn (s, g) => s <> g) pairs
    fun cows [] _ = 0
      | cows (g :: gs) pool =
          if List.exists (fn c => c = g) pool
          then 1 + cows gs (removeFirst g pool)
          else cows gs pool
  in (bulls, cows (map #2 rest) (map #1 rest)) end

val (b, c) = score "1807" "7810"
val () = print (Int.toString b ^ " bull(s), " ^ Int.toString c ^ " cow(s)\n")
