fun countOf x xs = length (List.filter (fn y => y = x) xs)

fun modes xs =
  let
    val top = foldl Int.max 0 (map (fn x => countOf x xs) xs)
    val winners = List.filter (fn x => countOf x xs = top) xs
  in
    ListMergeSort.uniqueSort Int.compare winners
  end

val () = print (String.concatWith "," (map Int.toString (modes [1, 2, 2, 3, 3, 4])) ^ "\n")
