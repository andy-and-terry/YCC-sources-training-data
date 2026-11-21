(* Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0). *)
fun pow (b, 0) = 1
  | pow (b, e) = b * pow (b, e - 1)

fun isMunchausen n =
  let
    fun go (0, acc) = acc
      | go (m, acc) =
          let val d = m mod 10
          in go (m div 10, acc + (if d = 0 then 0 else pow (d, d))) end
  in go (n, 0) = n end

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val () = print (String.concatWith " " (map Int.toString (List.filter isMunchausen (range (1, 4999)))) ^ "\n")
