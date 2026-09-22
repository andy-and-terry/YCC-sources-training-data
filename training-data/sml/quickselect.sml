fun quickselect ([], _) = raise Empty
  | quickselect (pivot :: rest, k) =
      let
        val smaller = List.filter (fn x => x < pivot) rest
        val larger = List.filter (fn x => x >= pivot) rest
        val numSmaller = length smaller
      in
        if k < numSmaller then quickselect (smaller, k)
        else if k > numSmaller then quickselect (larger, k - numSmaller - 1)
        else pivot
      end

val () = print (Int.toString (quickselect ([7, 10, 4, 3, 20, 15], 2)) ^ "\n")
val () = print (Int.toString (quickselect ([7, 10, 4, 3, 20, 15], 0)) ^ "\n")
