fun quicksort [] = []
  | quicksort (pivot :: rest) =
      let
        val smaller = List.filter (fn x => x < pivot) rest
        val larger = List.filter (fn x => x >= pivot) rest
      in
        quicksort smaller @ [pivot] @ quicksort larger
      end

val () = print (String.concatWith " " (map Int.toString (quicksort [5, 3, 8, 1, 9, 2])) ^ "\n")
