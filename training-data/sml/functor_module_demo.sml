signature COMPARABLE = sig
  type t
  val compare : t * t -> order
end

functor MakeSorter (C : COMPARABLE) = struct
  fun sort lst = ListMergeSort.sort (fn (a, b) => C.compare (a, b) = GREATER) lst
end

structure IntComparable = struct
  type t = int
  fun compare (a, b) = Int.compare (a, b)
end

structure IntSorter = MakeSorter (IntComparable)

val () = print (String.concatWith " " (map Int.toString (IntSorter.sort [5, 3, 8, 1])) ^ "\n")
