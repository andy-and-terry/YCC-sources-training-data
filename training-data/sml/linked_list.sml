datatype 'a node = Nil | Node of 'a * 'a node ref

fun fromList xs = foldr (fn (x, acc) => Node (x, ref acc)) Nil xs

fun toList Nil = []
  | toList (Node (x, next)) = x :: toList (!next)

fun appendValue (Nil, x) = Node (x, ref Nil)
  | appendValue (Node (v, next), x) = (next := appendValue (!next, x); Node (v, next))

fun lengthOf Nil = 0
  | lengthOf (Node (_, next)) = 1 + lengthOf (!next)

val list1 = fromList [1, 2, 3]
val list2 = appendValue (list1, 4)
val () = print (String.concatWith " " (map Int.toString (toList list2)) ^ "\n")
val () = print (Int.toString (lengthOf list2) ^ "\n")
