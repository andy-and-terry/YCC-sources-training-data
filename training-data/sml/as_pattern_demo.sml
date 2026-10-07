(* Layered patterns (x as pattern) bind a name to a whole value
   while also destructuring it. *)
fun dedupe (x :: (rest as y :: _)) =
      if x = y then dedupe rest else x :: dedupe rest
  | dedupe l = l

fun firstTwoOrAll (l as a :: b :: _) = ([a, b], l)
  | firstTwoOrAll l = (l, l)

fun describe (p as (x, y)) =
  let
    val (label, norm) =
      case p of
        (0, 0) => ("origin", 0)
      | (_, 0) => ("x-axis", abs x)
      | (0, _) => ("y-axis", abs y)
      | _ => ("plane", abs x + abs y)
  in label ^ " (" ^ Int.toString x ^ "," ^ Int.toString y ^ ") norm=" ^ Int.toString norm end

fun runs [] = []
  | runs (x :: xs) =
      let
        fun go (cur, n, []) = [(cur, n)]
          | go (cur, n, y :: ys) = if y = cur then go (cur, n + 1, ys) else (cur, n) :: go (y, 1, ys)
      in go (x, 1, xs) end

fun showInts l = print (String.concatWith " " (map Int.toString l) ^ "\n")

val () = showInts (dedupe [1, 1, 2, 3, 3, 3, 1])
val () = showInts (#1 (firstTwoOrAll [7, 8, 9, 10]))
val () = print (describe (0, 0) ^ "\n")
val () = print (describe (3, 0) ^ "\n")
val () = print (describe (~2, 5) ^ "\n")
val () = print (String.concatWith ";" (map (fn (c, n) => str c ^ Int.toString n) (runs (explode "aaabccdddd"))) ^ "\n")
