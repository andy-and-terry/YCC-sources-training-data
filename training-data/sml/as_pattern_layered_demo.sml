fun dup_head (l as x :: _) = x :: l
  | dup_head [] = []

fun show xs = "[" ^ String.concatWith "," (map Int.toString xs) ^ "]"
val () = print (show (dup_head [1, 2, 3]) ^ "\n")

fun insert_sorted (x, []) = [x]
  | insert_sorted (x, l as y :: ys) =
      if x <= y then x :: l else y :: insert_sorted (x, ys)

val () = print (show (foldl insert_sorted [] [5, 2, 8, 1]) ^ "\n")

fun describe (p as (x, y)) =
  if x = y then "diagonal " ^ Int.toString x
  else "pair sum " ^ Int.toString (#1 p + #2 p)
val () = print (describe (3, 3) ^ ", " ^ describe (1, 2) ^ "\n")

fun compress (a :: (rest as b :: _)) =
      if a = b then compress rest else a :: compress rest
  | compress l = l
val () = print (show (compress [1, 1, 2, 2, 2, 3, 1, 1]) ^ "\n")

datatype shape = Circle of real | Rect of real * real

fun normalize (s as Circle r) = if r < 0.0 then Circle (~r) else s
  | normalize (s as Rect (w, h)) = if w < 0.0 orelse h < 0.0 then Rect (abs w, abs h) else s

fun area (Circle r) = 3.14159 * r * r
  | area (Rect (w, h)) = w * h

val () = print (Real.toString (area (normalize (Circle ~2.0))) ^ "\n")
val () = print (Real.toString (area (normalize (Rect (2.0, ~3.0)))) ^ "\n")

val whole as (first, second) = (10, 20)
val () = print (Int.toString (first + second + #1 whole) ^ "\n")
