fun bwt s =
  let
    val n = String.size s
    val rots = List.tabulate (n, fn i => String.extract (s, i, NONE) ^ String.substring (s, 0, i))
    val sorted = ListMergeSort.sort (fn (a, b) => String.compare (a, b) = GREATER) rots
  in String.implode (map (fn r => String.sub (r, n - 1)) sorted) end

val () = print (bwt "banana$" ^ "\n")
