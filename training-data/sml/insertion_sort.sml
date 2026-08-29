fun insert (x, []) = [x]
  | insert (x, h :: t) = if x <= h then x :: h :: t else h :: insert (x, t)

fun insertion_sort [] = []
  | insertion_sort (h :: t) = insert (h, insertion_sort t)

val () = print (String.concatWith " " (map Int.toString (insertion_sort [12, 11, 13, 5, 6])) ^ "\n")
