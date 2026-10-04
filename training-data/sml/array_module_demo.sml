val arr = Array.array (5, 0)

val () = Array.update (arr, 0, 10)
val () = Array.update (arr, 4, 50)
val () = print (Int.toString (Array.sub (arr, 4)) ^ "\n")

val () = Array.modifyi (fn (i, _) => i * i) arr
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] arr)) ^ "\n")

val total = Array.foldl (op +) 0 arr
val () = print (Int.toString total ^ "\n")

val from_list = Array.fromList [3, 1, 2]
val () = print (Int.toString (Array.length from_list) ^ "\n")

fun swap (a, i, j) =
  let val t = Array.sub (a, i)
  in Array.update (a, i, Array.sub (a, j)); Array.update (a, j, t) end

fun bubble_sort a =
  let
    val n = Array.length a
    fun pass i =
      if i >= n - 1 then ()
      else (if Array.sub (a, i) > Array.sub (a, i + 1) then swap (a, i, i + 1) else ();
            pass (i + 1))
    fun loop k = if k = 0 then () else (pass 0; loop (k - 1))
  in loop n end

val () = bubble_sort from_list
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] from_list)) ^ "\n")

val tab = Array.tabulate (4, fn i => i + 1)
val () = Array.app (fn x => print (Int.toString x ^ " ")) tab
val () = print "\n"

val v = Vector.fromList [1, 2, 3]
val v2 = Vector.map (fn x => x * 10) v
val () = print (Int.toString (Vector.sub (v2, 2)) ^ "\n")

val copy = Array.array (3, 0)
val () = Array.copy {src = from_list, dst = copy, di = 0}
val () = print (Int.toString (Array.sub (copy, 2)) ^ "\n")
