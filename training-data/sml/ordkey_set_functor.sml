signature ORD_KEY = sig
  type ord_key
  val compare : ord_key * ord_key -> order
end

signature SIMPLE_SET = sig
  type item
  type set
  val empty : set
  val insert : set * item -> set
  val member : set * item -> bool
  val toList : set -> item list
end

functor MakeSet (K : ORD_KEY) : SIMPLE_SET = struct
  type item = K.ord_key
  type set = item list

  val empty = []

  fun member (s, x) = List.exists (fn y => K.compare (x, y) = EQUAL) s

  fun insert (s, x) =
    if member (s, x) then s else x :: s

  fun toList s = ListMergeSort.sort (fn (a, b) => K.compare (a, b) = GREATER) s
end

structure IntKey = struct
  type ord_key = int
  fun compare (a, b) = Int.compare (a, b)
end

structure IntSet = MakeSet (IntKey)

val s = IntSet.insert (IntSet.insert (IntSet.insert (IntSet.empty, 3), 1), 3)
val () = print (String.concatWith " " (map Int.toString (IntSet.toList s)) ^ "\n")
val () = print (Bool.toString (IntSet.member (s, 1)) ^ "\n")
val () = print (Bool.toString (IntSet.member (s, 2)) ^ "\n")
